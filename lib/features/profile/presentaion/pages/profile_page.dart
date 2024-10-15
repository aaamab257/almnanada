import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/features/auth/data/models/login_response.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_state.dart';
import 'package:almanada_app/features/main/presentaion/widgets/list_tile_widget.dart';
import 'package:almanada_app/util/app_strings.dart';

import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  LoginResponse? loginResponse;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<LoginCubit>()..userProfile(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) => di.sl<LoginCubit>(),
        builder: (context, state) {
          loginResponse = LoginCubit.get(context).userProfileData;
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      50.hBox,
                      Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage:
                                NetworkImage(loginResponse!.data!.photo!),
                          )),
                      40.hBox,
                      TextWidget(
                        loginResponse!.data!.name!,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        padding: paddingExt(top: 5, bottom: 10),
                        style: textStyle20(fontWeight: FontWeight.w600),
                      ),
                      15.hBox,
                      ListTileWidget(
                        title: AppStrings.aboutApp,
                        onTap: () {
                          Get.toNamed(Routes.aboutApp);
                        },
                      ),
                      // 5.hBox,
                      // ListTileWidget(
                      //   title: AppStrings.contactUs,
                      //   onTap: () {
                      //     Get.toNamed(Routes.contactUs);
                      //   },
                      // ),
                      5.hBox,
                      ListTileWidget(
                        title: AppStrings.language,
                        onTap: () {
                          Get.toNamed(Routes.changeLang);
                        },
                      ),
                      5.hBox,
                      // ListTileWidget(
                      //   title: AppStrings.previous,
                      //   onTap: () {
                      //     Get.toNamed(Routes.history);
                      //   },
                      // ),
                      // 2.hBox,
                      ListTileWidget(
                        title: AppStrings.editProfile,
                        onTap: () {
                          Get.toNamed(Routes.updateProfile);
                        },
                      ),
                      2.hBox,
                      ListTileWidget(
                        title: AppStrings.logOut,
                        onTap: () {
                          di.sl<LoginCubit>().saveToken("").then((onValue) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                Routes.login, (Route<dynamic> route) => false);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          }

          return SafeArea(
            child: Container(
              child: _body1(),
            ),
          );
        },
      ),
    );
  }
}
