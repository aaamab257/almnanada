// import 'package:kayesh/core/index.dart';

// class ShimmerEffectWidget extends StatelessWidget {
//   const ShimmerEffectWidget({
//     super.key,
//     required this.height,
//     required this.width,
//     this.radius,
//     this.margin,
//   });
//   final double height;
//   final double width;
//   final EdgeInsets? margin;
//   final double? radius;
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: AppColors.baseColor,
//       highlightColor: AppColors.highlightColor,
//       child: Container(
//         height: height,
//         width: width,
//         margin: margin ?? EdgeInsets.zero,
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: radius?.radius ?? 1.0.radius,
//         ),
//       ),
//     );
//   }
// }
