// import 'package:kayesh/core/index.dart';

// class HandlingDataWidget extends StatelessWidget {
//   const HandlingDataWidget({
//     super.key,
//     required this.requestState,
//     required this.child,
//     this.loadingWidget,
//     required this.image,
//     required this.title,
//     required this.subTitle,
//     this.onTap,
//     this.onTapAdd,
//   });
//   final ReqState requestState;
//   final Widget? loadingWidget;
//   final Widget child;
//   final String image, title, subTitle;
//   final VoidCallback? onTap, onTapAdd;
//   @override
//   Widget build(BuildContext context) {
//     return requestState.isLoading
//         ? loadingWidget ?? const LoadingWidget(color: AppColors.primary)
//         : requestState.isFailure
//             ? EmptyOrErrorWidget(
//                 image: AppImages.error,
//                 title: 'Something went wrong !!',
//                 subTitle: 'Something went wrong, please try again',
//                 onTap: onTap,
//               )
//             : requestState.isEmpty || requestState.isIdle
//                 ? EmptyOrErrorWidget(
//                     image: image,
//                     title: title,
//                     subTitle: subTitle,
//                     onTapAdd: onTapAdd,
//                   )
//                 : requestState.isOffline
//                     ? _NoInternetContent(onTap: onTap)
//                     : child;
//   }
// }

// class _NoInternetContent extends StatelessWidget {
//   const _NoInternetContent({required this.onTap});

//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: kPadding(start: 15, end: 15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ImageWidget(
//               path: AppImages.noWifi,
//               height: 125.h,
//               width: 125.h,
//               color: AppColors.grey3.withOpacity(0.6),
//             ),
//             15.height,
//             TextWidget(
//               'No Connection !',
//               style:
//                   getTextStyle14(fontSize: 17.0, fontWeight: FontWeight.w600),
//             ),
//             5.height,
//             TextWidget(
//               'Unable to connect to the server, check your\ninternet data and retry.',
//               textAlign: TextAlign.center,
//               style: getTextStyle14(
//                 fontSize: 15,
//                 color: AppColors.grey3,
//               ),
//             ),
//             20.height,
//             MainButtonWidget(
//               title: AppStrings.loginToContinue,
//               backgroundColor: AppColors.transparent,
//               borderColor: AppColors.primary,
//               titleColor: AppColors.primary,
//               radius: 30.r,
//               onPressed: onTap ?? () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class EmptyOrErrorWidget extends StatelessWidget {
//   const EmptyOrErrorWidget({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subTitle,
//     this.onTap,
//     this.onTapAdd,
//   });
//   final String image, title, subTitle;
//   final VoidCallback? onTap, onTapAdd;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: kPadding(start: 15, end: 15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ImageWidget(
//               path: image,
//               height: 125.h,
//               width: 125.h,
//               color: AppColors.grey3.withOpacity(0.6),
//             ),
//             20.height,
//             TextWidget(
//               title,
//               style: getTextStyle18(fontWeight: FontWeight.w600),
//             ),
//             7.5.height,
//             TextWidget(
//               subTitle,
//               textAlign: TextAlign.center,
//               style: getTextStyle14(
//                 fontSize: 15,
//                 color: AppColors.grey,
//                 height: 1.30,
//               ),
//             ),
//             7.5.height,
//             if (onTapAdd != null)
//               ImageWidget(
//                 onTap: onTapAdd,
//                 path: AppImages.plus,
//                 height: 15,
//                 width: 15,
//                 backgroundColor: AppColors.primary,
//               ),
//             if (onTap != null) ...[
//               20.height,
//               MainButtonWidget(
//                 title: AppStrings.loginToContinue,
//                 backgroundColor: AppColors.transparent,
//                 borderColor: AppColors.primary,
//                 titleColor: AppColors.primary,
//                 radius: 30.r,
//                 onPressed: onTap ?? () {},
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
