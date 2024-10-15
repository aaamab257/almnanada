import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/core/widgets/main_button_widget.dart';
import 'package:almanada_app/core/widgets/text_input_widget.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_state.dart';

import 'package:almanada_app/util/app_strings.dart';

import 'package:almanada_app/util/extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:get/get.dart';

import '../../../../config/localization/app_localization.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends StatefulWidget {
  String code;
  ChangePasswordScreen({super.key, required this.code});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _conPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                      body: SingleChildScrollView(
                        padding:
                            paddingExt(start: 25, top: 80, end: 25, bottom: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Align(
                            //   alignment: AlignmentDirectional.topCenter,
                            //   child: Image.asset(
                            //     AppImages.boyAvatar,
                            //     height: context.dHeight * 0.15,
                            //     width: context.dWidth * 0.4,
                            //     fit: BoxFit.fill,
                            //   ),
                            // ),

                            30.hBox,
                            TextInputWidget(
                              controller: _passController,
                              title: AppLocalizations.of(context)
                                      ?.translate('password') ??
                                  "password",
                              prefixIcon: const Icon(Icons.lock),
                              keyboardType: TextInputType.text,
                              isPassword: true,
                              textInputAction: TextInputAction.done,
                            ),
                            20.hBox,
                            TextInputWidget(
                              controller: _conPassController,
                              title: AppLocalizations.of(context)
                                      ?.translate('confirm_pass') ??
                                  "confirm_pass",
                              prefixIcon: const Icon(Icons.lock),
                              isPassword: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                            ),
                            // 20.hBox,
                            // InkWell(
                            //   onTap: () {
                            //     Get.toNamed(Routes.forgetPassword);
                            //   },
                            //   child: TextWidget(
                            //     AppStrings.forgetPassword,
                            //     style: textStyle14(
                            //         fontWeight: FontWeight.w600,
                            //         color: AppColors.primary),
                            //   ),
                            // ),
                            20.hBox,
                            MainButtonWidget(
                              title: AppStrings.send,
                              onPressed: () async {
                                print(
                                    'code ============ ${widget.code}   , ,, , ${_passController.text}  ===== ? ${_conPassController.text}');
                                di
                                    .sl<LoginCubit>()
                                    .changePassCode(
                                        widget.code,
                                        _passController.text,
                                        _conPassController.text)
                                    .then((onValue) {
                                  Get.toNamed(Routes.login);
                                });
                              },
                            ),
                            30.hBox,
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }

              return Scaffold(
                body: Container(
                  child: _body1(),
                ),
              );
            }));
  }
}
