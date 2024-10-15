import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainButtonWidget extends StatefulWidget {
  const MainButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.loadingColor,
    this.borderWidth,
    this.titleColor,
    this.fontSize,
    this.height,
    this.width,
    this.radius,
    this.padding,
  });
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor, loadingColor;
  final double? borderWidth;
  final Color? titleColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? radius;

  final EdgeInsetsGeometry? padding;

  @override
  State<MainButtonWidget> createState() => _MainButtonWidgetState();
}

class _MainButtonWidgetState extends State<MainButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _tween.animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeIn,
        ),
      ),
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              widget.width?.w ?? context.width,
              widget.height?.h ?? 55.h,
            ),
            maximumSize: Size(
              widget.width?.w ?? context.width,
              widget.height?.h ?? 55.h,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: widget.borderWidth ?? 1.0,
                color: widget.borderColor ?? AppColors.transparent,
              ),
              borderRadius: BorderRadius.circular(widget.radius?.r ?? 30.r),
            ),
            elevation: 0.0,
            shadowColor: AppColors.transparent,
            backgroundColor: widget.backgroundColor ?? AppColors.primary,
          ),
          onPressed: () {
            _controller.forward().then((_) {
              _controller.reverse();
            });
            widget.onPressed();
          },
          child: FittedBox(
            child: TextWidget(
              widget.title.tr,
              style: textStyle14(
                fontSize: widget.fontSize?.sp ?? 16.sp,
                color: widget.titleColor ?? AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
