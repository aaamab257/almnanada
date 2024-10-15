import 'package:almanada_app/config/localization/app_localization.dart';
import 'package:almanada_app/core/index.dart';
import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/core/widgets/custom_snakbar.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/core/widgets/main_button_widget.dart';
import 'package:almanada_app/core/widgets/text_input_widget.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_state.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:almanada_app/di.dart' as di;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextForm Controller
  TextEditingController _emailController = TextEditingController();

  // Form Validation
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: BlocProvider(
        create: (context) => di.sl<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) => di.sl<LoginCubit>(),
            builder: (context, state) {
              Widget _body1() {
                if (state is LoginLoading) {
                  return const LoadingScreen();
                } else if (state is LoginError) {
                  return AppErrorWidget(
                    onPress: () {
                      setState(() {});
                    },
                  );
                } else {
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBarWidget(
                        title: TextWidget(
                          AppLocalizations.of(context)
                                  ?.translate('forgetPasswordw') ??
                              "forgetPasswordw",
                          style: textStyle14(color: AppColors.white),
                        ),
                      ),
                      body: Container(
                        padding:
                            paddingExt(start: 20, top: 20, end: 20, bottom: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              TextInputWidget(
                                controller: _emailController,
                                title: AppLocalizations.of(context)
                                        ?.translate('email') ??
                                    "email",
                                prefixIcon: AppImages.profile,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.done,
                              ),
                              20.hBox,
                              MainButtonWidget(
                                title: AppStrings.send,
                                onPressed: () async {
                                  if (_validateAndSave()) {
                                    await di
                                        .sl<LoginCubit>()
                                        .forgetPassword(_emailController.text)
                                        .then((value) async {
                                      if (value == "code_sent") {
                                        Get.toNamed(Routes.verifyCode);
                                      } else {
                                        showSnackBar(
                                          context,
                                          AppLocalizations.of(context)
                                                  ?.translate(
                                                      'emailNotFound') ??
                                              "emailNotFound",
                                        );
                                      }
                                    });
                                  }
                                },
                              ),
                              20.hBox,
                              // Center(
                              //   child: GestureDetector(
                              //     onTap: _navigateToSignIn,
                              //     child: RichText(
                              //       text: TextSpan(
                              //         text: AppString,
                              //         style:
                              //             textStyle14(color: Colors.black),
                              //         children: <TextSpan>[
                              //           TextSpan(
                              //             text: AppStrings.login,
                              //             style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.blue,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }

              return SafeArea(
                child: Scaffold(
                  body: Container(
                    child: _body1(),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void _navigateToSignIn() {
    Get.toNamed(Routes.login);
  }
}
