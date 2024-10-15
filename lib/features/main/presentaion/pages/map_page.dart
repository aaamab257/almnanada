import 'package:almanada_app/core/index.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: context.width,
                height: context.height * 0.35,
                decoration: const BoxDecoration(color: AppColors.white),
                child: const Center(
                  child: Text("Map"),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: TextWidget(
                        "الزمن المتبقي للوصول ١٠ دقائق ",
                        style: textStyle14(fontWeight: FontWeight.w300),
                        padding:
                            paddingExt(bottom: 10, top: 10, start: 10, end: 10),
                      ),
                    ),
                    20.wBox,
                    // ...List.generate(
                    //   2,
                    //   (index) => const StudentWidget(
                    //     name: "",
                    //     studentClass: "",
                    //     studentCode: "",
                    //     photo: "",
                    //     color: AppColors.white,
                    //   ),
                    // ),
                    // 25.wBox,
                  ],
                ),
              ),
              Padding(
                padding: paddingExt(bottom: 10, top: 25, start: 15, end: 15),
                child: MainButtonWidget(title: "تم الوصول", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
