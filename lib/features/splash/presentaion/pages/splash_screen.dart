import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';

import 'package:almanada_app/features/profile/data/models/setting_model.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';
import 'package:almanada_app/features/splash/presentaion/manager/splash_controller.dart';

import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   String? token, type;
//   Timer r

//   @override
//   void initState() {
//     Timer.periodic(
//         const Duration(milliseconds: 3000), (Timer r) => _routeToOnboarding());
//     // di.sl<LoginCubit>().getToken().then((onValue) {
//     //   token = onValue;
//     // });
//     // di.sl<LoginCubit>().gettype().then((onValue) {
//     //   type = onValue;
//     // });

//     // if (token == "") {
//     //   _routeToOnboarding();
//     //   print("token ========================= > ${token}");
//     // }
//     // if (token != "" && type == "observer") {
//     //   _routeToHomeObserver();
//     //   print("token ========================= > ${token}");
//     // }
//     // if (token != "" && type == "parent") {
//     //   _routeToHome();
//     //   print("token ========================= > ${token}");
//     // }
//     super.initState();
//   }

//   void _routeToOnboarding() {
//     Get.offNamedUntil(Routes.onboarding, (route) => false);
//   }

//   void _routeToHomeObserver() {
//     Get.offNamedUntil(Routes.mainObserver, (route) => false);
//   }

//   void _routeToHome() {
//     Get.offNamedUntil(Routes.main, (route) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     SettingModel? settingModel;
//     return BlocProvider(
//       create: (context) => di.sl<HistoryCubit>()..getSettings(),
//       child: BlocConsumer<HistoryCubit, HistoryState>(
//         listener: (context, state) => di.sl<HistoryCubit>(),
//         builder: (context, state) {
//           settingModel = HistoryCubit.get(context).settingModel;
//           Widget _body1() {
//             if (state is HistoryLoading) {
//               return const LoadingScreen();
//             } else if (state is HistoryError) {
//               return AppErrorWidget(
//                 onPress: () {},
//               );
//             } else {
//               return Scaffold(
//                 backgroundColor: AppColors.background,
//                 body: Container(
//                   height: context.dHeight,
//                   width: context.dWidth,
//                   margin: paddingExt(start: 40, top: 0, end: 40),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.network(
//                         settingModel!.data!.splashScreenImg!,
//                         height: context.dHeight * 0.50,
//                         width: context.dWidth,
//                         fit: BoxFit.fill,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }
//           }

//           return _body1();
//         },
//       ),
//     );
//   }
// }

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingModel? settingModel;
    return BlocProvider(
      create: (context) => di.sl<HistoryCubit>()..getSettings(),
      child: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) => di.sl<HistoryCubit>(),
        builder: (context, state) {
          settingModel = HistoryCubit.get(context).settingModel;
          Widget _body1() {
            if (state is HistoryLoading) {
              return const LoadingScreen();
            } else if (state is HistoryError) {
              return AppErrorWidget(
                onPress: () {},
              );
            } else {
              return Scaffold(
                backgroundColor: AppColors.background,
                body: Container(
                  height: context.dHeight,
                  width: context.dWidth,
                  margin: paddingExt(start: 40, top: 0, end: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        settingModel!.data!.splashScreenImg!,
                        height: context.dHeight * 0.50,
                        width: context.dWidth,
                        fit: BoxFit.fill,
                      ),
                      // TextWidget(
                      //   AppStrings.appName,
                      //   textAlign: TextAlign.center,
                      //   style: textStyle20(
                      //     color: AppColors.textColor,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            }
          }

          return _body1();
        },
      ),
    );
  }
}
