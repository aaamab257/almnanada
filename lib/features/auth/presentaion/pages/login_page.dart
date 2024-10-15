import 'package:almanada_app/config/localization/app_localization.dart';
import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/core/widgets/custom_snakbar.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/core/widgets/main_button_widget.dart';
import 'package:almanada_app/core/widgets/text_input_widget.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/features/auth/data/models/login_request.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_state.dart';
import 'package:almanada_app/features/profile/data/models/setting_model.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';

import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  FirebaseMessaging? _firebaseMessaging;
  SettingModel? settingModel;

  String? device_token;
  @override
  void initState() {
    _firebaseMessaging = FirebaseMessaging.instance; // Change here
    _firebaseMessaging!.getToken().then((token) {
      device_token = token;
      print("device_token ===================== is $token");
    });
    super.initState();
  }

  @override
  void dispose() {
    _passController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as Arguments;

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
                            BlocProvider(
                              create: (context) =>
                                  di.sl<HistoryCubit>()..getSettings(),
                              child: BlocConsumer<HistoryCubit, HistoryState>(
                                listener: (context, state) =>
                                    di.sl<HistoryCubit>(),
                                builder: (context, state) {
                                  settingModel =
                                      HistoryCubit.get(context).settingModel;
                                  Widget _body1() {
                                    if (state is HistoryLoading) {
                                      return const LoadingScreen();
                                    } else if (state is HistoryError) {
                                      return AppErrorWidget(
                                        onPress: () {
                                          setState(() {});
                                        },
                                      );
                                    } else {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional.topCenter,
                                        child: Image.network(
                                          settingModel!.data!.login_app_img!,
                                          height: context.dHeight * 0.15,
                                          width: context.dWidth * 0.4,
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    }
                                  }

                                  return _body1();
                                },
                              ),
                            ),
                            20.hBox,
                            15.hBox,
                            TextWidget(
                              AppStrings.login,
                              style: textStyle18(fontWeight: FontWeight.w600),
                            ),
                            30.hBox,
                            TextInputWidget(
                              controller: _emailController,
                              title: AppStrings.email,
                              prefixIcon: AppImages.profile,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                            ),
                            20.hBox,
                            TextInputWidget(
                              controller: _passController,
                              title: AppStrings.password,
                              prefixIcon: const Icon(Icons.lock),
                              keyboardType: TextInputType.text,
                              isPassword: true,
                              textInputAction: TextInputAction.done,
                            ),
                            20.hBox,
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.forgetPassword);
                              },
                              child: TextWidget(
                                AppStrings.forgetPassword,
                                style: textStyle14(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black),
                              ),
                            ),
                            20.hBox,
                            MainButtonWidget(
                              title: AppStrings.login,
                              onPressed: () async {
                                String email = _emailController.text;
                                if (email.isEmpty) {
                                  showSnackBar(
                                      context, AppStrings.enterYourmail.tr);
                                } else if (_passController.text.isEmpty) {
                                  showSnackBar(
                                      context, AppStrings.enterYourpassword.tr);
                                } else {
                                  LoginCubit.get(context)
                                      .login(LoginRequest(
                                          email: email,
                                          password: _passController.text,
                                          deviceToken: device_token!))
                                      .then((value) async {
                                    if (value.status! == 200) {
                                      await LoginCubit.get(context)
                                          .saveToken(value.data!.token!);
                                      await LoginCubit.get(context)
                                          .saveType(value.data!.type!);
                                      if (value.data!.type == 'parent') {
                                        Get.toNamed(Routes.main);
                                      } else if (value.data!.type == 'admin') {
                                        showSnackBar(
                                            context,
                                            AppLocalizations.of(context)!
                                                    .translate('admin') ??
                                                "Sorry you cant login here");
                                      } else if (value.data!.type ==
                                          'observer') {
                                        Get.toNamed(Routes.mainObserver);
                                      }
                                    } else if (value.status! == 401) {
                                      showSnackBar(context,
                                          "البريد او كلمة المرور غير صحيح");
                                    }
                                  });
                                }
                              },
                            ),
                            30.hBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  AppStrings.dontHaveAnAccount,
                                  style: textStyle14(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black),
                                ),
                                8.wBox,
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.register);
                                  },
                                  child: TextWidget(
                                    AppStrings.signUp,
                                    style: textStyle14(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary),
                                  ),
                                ),
                              ],
                            ),
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
