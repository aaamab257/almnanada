import 'package:almanada_app/config/localization/app_localization.dart';
import 'package:almanada_app/config/size_config.dart';
import 'package:almanada_app/core/index.dart';
import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/core/utils/colors/colors_manager.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/features/auth/data/models/onboarding_model.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  FirebaseMessaging? _firebaseMessaging;
  OnboardingModel? onboardingModel;

  String? deviceToken;

  @override
  void initState() {
    _controller = PageController();
    _firebaseMessaging = FirebaseMessaging.instance; // Change here
    _firebaseMessaging!.getToken().then((token) {
      deviceToken = token;
      print("device_token ===================== is $token");
    });
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF000000),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    return BlocProvider(
      create: (context) => di.sl<HistoryCubit>()..getOnBoarding(),
      child: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) => di.sl<HistoryCubit>(),
        builder: (context, state) {
          onboardingModel = HistoryCubit.get(context).onboardingModel;
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
              return Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (value) =>
                          setState(() => _currentPage = value),
                      itemCount:
                          onboardingModel!.data!.onboardingDetails!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              Image.network(
                                onboardingModel!
                                    .data!.onboardingDetails![i].photo!,
                                height: 150.h,
                              ),
                              SizedBox(
                                height: 60.h,
                              ),
                              Text(
                                onboardingModel!
                                    .data!.onboardingDetails![i].name!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30.sp,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                onboardingModel!
                                    .data!.onboardingDetails![i].desc!,
                                style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17.sp,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingModel!.data!.onboardingDetails!.length,
                            (int index) => _buildDots(
                              index: index,
                            ),
                          ),
                        ),
                        _currentPage + 1 ==
                                onboardingModel!.data!.onboardingDetails!.length
                            ? Padding(
                                padding: paddingExt(
                                    top: 30, bottom: 30, start: 30, end: 30),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.offNamedUntil(
                                        Routes.login,
                                        arguments: Arguments(deviceToken!),
                                        (route) => false);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: (width <= 550)
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 100, vertical: 20)
                                        : EdgeInsets.symmetric(
                                            horizontal: width * 0.2,
                                            vertical: 25),
                                    textStyle: TextStyle(
                                        fontSize: (width <= 550) ? 13 : 17),
                                  ),
                                  child: TextWidget(
                                    AppStrings.start,
                                    style: textStyle14(color: AppColors.white),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        _controller.jumpToPage(2);
                                      },
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: (width <= 550) ? 13 : 17,
                                        ),
                                      ),
                                      child: TextWidget(
                                        AppStrings.skip,
                                        style: textStyle16(color: Colors.black),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        elevation: 0,
                                        padding: (width <= 550)
                                            ? const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 20)
                                            : const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 25),
                                        textStyle: TextStyle(
                                            fontSize: (width <= 550) ? 13 : 17),
                                      ),
                                      child: TextWidget(AppStrings.next,
                                          style: textStyle14(
                                              color: ColorsManager.white)),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              );
            }
          }

          return Scaffold(body: _body1());
        },
      ),
    );
  }
}
