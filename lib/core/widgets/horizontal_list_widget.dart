import 'package:flutter/material.dart';

class HorizontalListBuilder extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double spacing, runSpacing;
  final EdgeInsetsDirectional padding;
  final ScrollPhysics? physics;
  final bool reverse;
  final ScrollController? controller;
  final Axis scrollType;
  final List<Widget>? list;
  final WrapAlignment wrapAlignment;
  final WrapCrossAlignment crossAxisAlignment;

  const HorizontalListBuilder({
    required this.itemCount,
    required this.itemBuilder,
    this.scrollType = Axis.horizontal,
    this.spacing = 8,
    this.runSpacing = 8,
    this.padding = EdgeInsetsDirectional.zero,
    this.physics,
    this.controller,
    this.reverse = false,
    this.wrapAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    super.key,
    this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: physics,
      padding: padding,
      scrollDirection: scrollType,
      reverse: reverse,
      controller: controller,
      child: Wrap(
        spacing: spacing,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        direction: scrollType,
        runAlignment: wrapAlignment,
        crossAxisAlignment: crossAxisAlignment,
        runSpacing: runSpacing,
        children: list ??
            List.generate(
              itemCount,
              (index) => itemBuilder(context, index),
            ),
      ),
    );
  }
}

class HorizontalListWidget extends StatelessWidget {
  final double spacing, runSpacing;
  final EdgeInsets padding;
  final ScrollPhysics? physics;
  final bool reverse;
  final ScrollController? controller;
  final Axis scrollType;
  final List<Widget> children;

  final WrapAlignment wrapAlignment;
  final WrapCrossAlignment crossAxisAlignment;

  const HorizontalListWidget({
    this.scrollType = Axis.horizontal,
    this.spacing = 8,
    this.runSpacing = 8,
    this.padding = EdgeInsets.zero,
    this.physics,
    this.controller,
    this.reverse = false,
    this.wrapAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: physics,
      padding: padding,
      scrollDirection: scrollType,
      reverse: reverse,
      controller: controller,
      child: Wrap(
        spacing: spacing,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        direction: scrollType,
        runAlignment: wrapAlignment,
        crossAxisAlignment: crossAxisAlignment,
        runSpacing: runSpacing,
        children: children,
      ),
    );
  }
}
