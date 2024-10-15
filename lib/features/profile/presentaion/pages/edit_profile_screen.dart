import 'package:almanada_app/core/widgets/app_bar_widget.dart';
import 'package:almanada_app/core/widgets/custom_snakbar.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/core/widgets/main_button_widget.dart';
import 'package:almanada_app/core/widgets/text_input_widget.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/features/auth/data/models/login_response.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_state.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  LoginResponse? loginResponse;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

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
                  _emailController.text = loginResponse!.data!.email!;
                  _nameController.text = loginResponse!.data!.name!;
                  _addressController.text = loginResponse!.data!.address!;

                  return SingleChildScrollView(
                    child: Container(
                      padding:
                          paddingExt(bottom: 10, top: 10, start: 10, end: 10),
                      child: Column(
                        children: [
                          30.hBox,
                          Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: CircleAvatar(
                                radius: 60.r,
                                backgroundImage:
                                    NetworkImage(loginResponse!.data!.photo!),
                              )),
                          50.hBox,
                          Column(
                            children: [
                              TextInputWidget(
                                controller: _emailController,
                                title: AppStrings.email,
                                prefixIcon: AppImages.profile,
                                readOnly: true,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.done,
                              ),
                              20.hBox,
                              TextInputWidget(
                                controller: _nameController,
                                title: AppStrings.name,
                                prefixIcon: AppImages.profile,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                              ),
                              20.hBox,
                              TextInputWidget(
                                controller: _addressController,
                                title: AppStrings.address,
                                prefixIcon: AppImages.profile,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                              ),
                              35.hBox,
                              MainButtonWidget(
                                title: AppStrings.update,
                                onPressed: () async {
                                  if (_nameController.text.isEmpty) {
                                    showSnackBar(context, "يرجي ادخال الاسم");
                                  } else if (_addressController.text.isEmpty) {
                                    showSnackBar(context, "يرجي ادخال العنوان");
                                  } else {
                                    await di
                                        .sl<LoginCubit>()
                                        .updateProfile(
                                            _nameController.text.trim(),
                                            _addressController.text.trim())
                                        .then((value) {
                                      if (value.status == 200) {
                                        showSnackBar(
                                            context, "تم تعديل البيانات بنجاح");
                                      } else {
                                        showSnackBar(context,
                                            "خطأ يرجي المحاولة في وقت لاحق");
                                      }
                                    });
                                  }
                                },
                              ),
                              30.hBox,
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }

              return Scaffold(
                appBar: AppBarWidget(
                  title: TextWidget(
                    AppStrings.profile,
                    style: textStyle14(color: AppColors.white),
                  ),
                ),
                body: Container(
                  child: _body1(),
                ),
              );
            }));
  }
}
