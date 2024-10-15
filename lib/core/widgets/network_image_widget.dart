// import 'package:kayesh/core/index.dart';

// class NetworkImageWidget extends StatelessWidget {
//   const NetworkImageWidget({
//     Key? key,
//     required this.image,
//     required this.height,
//     this.width,
//     this.fit,
//     this.borderRadius,
//     this.iconSize,
//     this.isBorder = false,
//     this.borderColor,
//     this.backgroundColor,
//     this.error,
//   }) : super(key: key);

//   final String image;
//   final String? error;
//   final double? height;
//   final double? width;
//   final BoxFit? fit;
//   final BorderRadius? borderRadius;
//   final double? iconSize;
//   final bool isBorder;
//   final Color? borderColor, backgroundColor;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       width: width ?? context.width,
//       child: CachedNetworkImage(
//         imageUrl: image,
//         // placeholder: (context, url) => const LoadingWidget(color: AppColors.primary),
//         progressIndicatorBuilder: (context, url, progress) => Center(
//           child: SizedBox(
//             height: 20.h,
//             width: 20.h,
//             child: CircularProgressIndicator.adaptive(
//               value: progress.progress,
//               valueColor:
//                   const AlwaysStoppedAnimation<Color>(AppColors.primary),
//             ),
//           ),
//         ),
//         filterQuality: FilterQuality.high,
//         imageBuilder: (context, imageProvider) => Container(
//           decoration: BoxDecoration(

//             color: backgroundColor ?? AppColors.background,
//             border: isBorder
//                 ? Border.all(
//                     width: 3.5.w,
//                     color: borderColor ?? AppColors.background,
//                   )
//                 : null,
//             borderRadius: borderRadius,
//             image: DecorationImage(
//               image: imageProvider,
//               fit: fit ?? BoxFit.cover,
//               filterQuality: FilterQuality.high,
//             ),
//           ),
//         ),
//         errorWidget: (context, url, _) => Container(
//           decoration: BoxDecoration(
//             color: backgroundColor ?? AppColors.background,
//             border: isBorder
//                 ? Border.all(
//                     width: 3.5.w,
//                     color: borderColor ?? AppColors.background,
//                   )
//                 : null,
//             borderRadius: borderRadius,
//           ),
//           child: Center(
//             child: SvgPicture.asset(
//               '$error',
//               height: 25.h,
//               width: 25.h,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
