import 'package:almanada_app/config/localization/app_localization.dart';
import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/core/widgets/app_bar_widget.dart';
import 'package:almanada_app/core/widgets/custom_snakbar.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/core/widgets/main_button_widget.dart';
import 'package:almanada_app/core/widgets/text_input_widget.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/features/auth/data/models/login_request.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_state.dart';
import 'package:almanada_app/features/auth/presentaion/widgets/type_filter.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _conPassController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: AppStrings.register,
      ),
      body: SafeArea(
        child: BlocProvider(
            create: (context) => di.sl<LoginCubit>(),
            child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) => di.sl<LoginCubit>(),
                builder: (context, state) {
                  return state is LoginLoading
                      ? LoadingScreen()
                      : SingleChildScrollView(
                          padding: paddingExt(
                              start: 25, top: 50, end: 25, bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: Image.asset(
                                  AppImages.boyAvatar,
                                  height: context.dHeight * 0.15,
                                  width: context.dWidth * 0.4,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              20.hBox,
                              TextWidget(
                                AppStrings.signUp,
                                style: textStyle18(fontWeight: FontWeight.w600),
                              ),
                              30.hBox,
                              TextInputWidget(
                                title: AppStrings.name,
                                prefixIcon: AppImages.profile,
                                controller: _nameController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                              ),
                              30.hBox,
                              TextInputWidget(
                                title: AppStrings.email,
                                controller: _emailController,
                                prefixIcon: AppImages.profile,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                              ),
                              30.hBox,
                              TextWidget(
                                AppStrings.accType,
                                style: textStyle14(
                                  color: const Color(0xFF091130),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              5.hBox,
                              Container(
                                width: context.dWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.r),
                                    color: Theme.of(context).cardColor,
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 0.3)),
                                child: TypeFilter(
                                    itemsList: di.sl<LoginCubit>().typeAR),
                              ),
                              30.hBox,
                              TextInputWidget(
                                title: AppStrings.mobileNumber,
                                prefixIcon: AppImages.profile,
                                controller: _phoneController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                              ),
                              30.hBox,
                              TextInputWidget(
                                title: AppStrings.password,
                                controller: _passController,
                                prefixIcon: Icon(Icons.lock),
                                keyboardType: TextInputType.text,
                                isPassword: true,
                                textInputAction: TextInputAction.done,
                              ),
                              35.hBox,
                              MainButtonWidget(
                                  title: AppStrings.register,
                                  onPressed: () {
                                    String email = _emailController.text;
                                    if (email.isEmpty) {
                                      showSnackBar(
                                          context, AppStrings.enterYourmail.tr);
                                    } else if (_passController.text.isEmpty) {
                                      showSnackBar(context,
                                          AppStrings.enterYourpassword.tr);
                                    } else if (LoginCubit.get(context)
                                        .selectedType
                                        .isEmpty) {
                                      showSnackBar(
                                          context, "يرجي اختيار نوع الحساب");
                                    } else {
                                      LoginCubit.get(context)
                                          .register(
                                        RegisterRequest(
                                            name: _nameController.text.trim(),
                                            email: email.trim(),
                                            password:
                                                _passController.text.trim(),
                                            type: LoginCubit.get(context)
                                                .selectedType
                                                .trim(),
                                            phone:
                                                _phoneController.text.trim()),
                                      )
                                          .then((value) async {
                                        if (value.status! == 200) {
                                          await LoginCubit.get(context)
                                              .saveToken(value.data!.token!);
                                          await LoginCubit.get(context)
                                              .saveType(value.data!.type!);
                                          if (value.data!.type == 'parent') {
                                            Get.toNamed(Routes.main);
                                          } else if (value.data!.type ==
                                              'admin') {
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
                                  }),
                            ],
                          ),
                        );
                })),
      ),
    );
  }
}
