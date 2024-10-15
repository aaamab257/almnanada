import 'dart:async';
import 'package:almanada_app/core/widgets/custom_snakbar.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/core/widgets/student_widget.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/features/auth/data/models/sliders_model.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_state.dart';
import 'package:almanada_app/features/main/data/models/students_model.dart';
import 'package:almanada_app/features/main/presentaion/widgets/list_tile_widget.dart';

import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Student? student;
  Sliders? sliders;
  Position? position;
  List<String> images = [];
  Timer? timeronReach, timerCallStudent;
  double? distance, schoolDis;
  double? lat, long;
  bool isCalled = false;
  int? callId;
  Color color = AppColors.white;
  int selectedIndex = -1;
  Set<int> selectedIndexes = {};

  @override
  void deactivate() {
    super.deactivate();
    timeronReach!.cancel();
    timerCallStudent!.cancel();
    print(" On deactivate method ======================== ? ");
  }

  @override
  void initState() {
    timeronReach = Timer.periodic(
        const Duration(milliseconds: 6000),
        (Timer t) => setState(() {
              di.sl<LoginCubit>().getParentCurrentPosition().then((postion) {
                setState(() {
                  di.sl<LoginCubit>().dbFASTOSN().then((schoolDista) {
                    di
                        .sl<LoginCubit>()
                        .calculateDistance(
                          postion.latitude,
                          postion.longitude,
                          double.parse(schoolDista.data!.lat!),
                          double.parse(schoolDista.data!.long!),
                        )
                        .then((onValue) {
                      schoolDis = double.parse(schoolDista.data!.dBFASTOSN!);
                      print(
                          "Schooool Distanse ========================================= > ${schoolDista.data!.dBFASTOSN!} ");
                      setState(() {
                        distance = onValue / 1000;
                        print('Distance ================ > $distance');
                        if (distance! + 2 <= schoolDis!) {
                          di
                              .sl<LoginCubit>()
                              .getStudents()
                              .then((onValue) async {
                            timeronReach!.cancel();
                            for (var student in onValue.data!.list!) {
                              await di
                                  .sl<LoginCubit>()
                                  .callStudentOnReach(student.id!)
                                  .then((onValue) {
                                showSnackBar(context,
                                    "تم ارسال اشعار للطالب ${student.name} الي مشرف الدور");
                              });
                            }
                          });
                        }
                      });
                    });
                  });
                });
              });
            }));

    timerCallStudent = Timer.periodic(
      const Duration(milliseconds: 10000),
      (Timer t) => setState(() {
        di.sl<LoginCubit>().getParentCurrentPosition().then((postion) {
          if (distance! == 0 || distance! < 1) {
            print("Passed this condition =============================>");
            //timer!.cancel();
            if (student!.data!.list!.length != 0) {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.r)),
                  ),
                  builder: (contextx) {
                    timerCallStudent!.cancel();
                    return StatefulBuilder(
                        builder: (BuildContext contextb, StateSetter setState) {
                      return Container(
                          height: 450.h,
                          child: Padding(
                              padding: paddingExt(
                                  start: 15, top: 15, end: 15, bottom: 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      AppStrings.selectStudent,
                                      style:
                                          textStyle16(color: AppColors.black),
                                    ),
                                    20.wBox,
                                    ...List.generate(
                                      student!.data!.list!.length,
                                      (index) => InkWell(
                                        onTap: () {
                                          setState(() {
                                            setState(() {
                                              if (selectedIndexes
                                                  .contains(index)) {
                                                selectedIndexes.remove(index);
                                              } else {
                                                selectedIndexes.add(index);
                                              }
                                            });
                                          });

                                          di
                                              .sl<LoginCubit>()
                                              .callStudent(student!
                                                  .data!.list![index].id!)
                                              .then((onValue) {
                                            if (onValue.status == 200) {
                                              if (onValue.data!.callTime ==
                                                  null) {
                                                showSnackBar(contextb,
                                                    "${student!.data!.list![index].name} تم استدعاء الطالب");
                                              } else {
                                                showSnackBar(contextb,
                                                    "تم استدعاء الطالب من قبل يرجى الانتظار حتي خروج الطالب");
                                              }
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: selectedIndexes
                                                      .contains(index)
                                                  ? AppColors.primary
                                                  : color),
                                          child: StudentWidget(
                                            color: color,
                                            name: student!
                                                .data!.list![index].name!,
                                            studentClass: student!.data!
                                                .list![index].floor!.name_ar!,
                                            studentCode: student!.data!
                                                .list![index].room!.name_ar!,
                                            photo: student!
                                                .data!.list![index].photo!,
                                          ),
                                        ),
                                      ),
                                    )
                                  ])));
                    });
                  });
            }
          }
        });
      }),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timeronReach!.cancel();
    timerCallStudent!.cancel();
    print(" On Dispose method ======================== ? ");
  }

  Future<void> _pullRefresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocProvider(
                create: (context) => di.sl<LoginCubit>()..getSliders(),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) => di.sl<LoginCubit>(),
                  builder: (context, state) {
                    sliders = LoginCubit.get(context).sliders;

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
                        for (var image in sliders!.data!.list!) {
                          if (images.length < sliders!.data!.list!.length) {
                            images.add(image.slider!);
                          }
                        }
                        return FanCarouselImageSlider.sliderType2(
                          imagesLink: images,
                          isAssets: false,
                          autoPlay: true,
                          sliderHeight: 200,
                          imageFitMode: BoxFit.fill,
                          currentItemShadow: const [],
                          sliderDuration: const Duration(milliseconds: 200),
                          imageRadius: 0,
                          slideViewportFraction: 1.2,
                        );
                      }
                    }

                    return _body1();
                  },
                ),
              ),
              15.hBox,
              BlocProvider(
                create: (context) =>
                    di.sl<LoginCubit>()..getParentCurrentPosition(),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) =>
                      di.sl<LoginCubit>().getParentCurrentPosition(),
                  builder: (context, state) {
                    position = LoginCubit.get(context).currentPosition;

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
                        return SizedBox(
                          height: 250.h,
                          child: GoogleMap(
                            myLocationButtonEnabled: true,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  position!.latitude, position!.longitude),
                              zoom: 15.0,
                            ),
                            onMapCreated: (controller) {
                              controller.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                      target: LatLng(position!.latitude,
                                          position!.longitude),
                                      zoom: 15.0),
                                ),
                              );
                            },
                            markers: Set<Marker>.from([
                              Marker(
                                markerId: MarkerId('user_location'),
                                position: LatLng(
                                    position!.latitude, position!.longitude),
                                icon: BitmapDescriptor.defaultMarker,
                              ),
                            ]),
                          ),
                        );
                      }
                    }

                    return _body1();
                  },
                ),
              ),
              5.hBox,
              ListTileWidget(
                title: AppStrings.monadaStudent,
                onTap: () async {
                  for (var student in student!.data!.list!) {
                    await di
                        .sl<LoginCubit>()
                        .callStudentOnReach(student.id!)
                        .then((onValue) {
                      showSnackBar(context,
                          "تم ارسال اشعار للطالب ${student.name} الي مشرف الدور");
                    });
                  }
                },
              ),
              5.hBox,
              ListTileWidget(
                title: AppStrings.callStudentManual,
                onTap: () async {
                  for (var student in student!.data!.list!) {
                    await di
                        .sl<LoginCubit>()
                        .callStudent(student.id!)
                        .then((onValue) {
                      if (onValue.status == 200) {
                        if (onValue.data!.callTime == null) {
                          showSnackBar(
                              context, "${student.name!} تم استدعاء الطالب");
                        } else {
                          showSnackBar(context,
                              "تم استدعاء الطالب من قبل يرجى الانتظار حتي خروج الطالب");
                        }
                      }
                    });
                  }
                },
              ),
              5.hBox,
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    5.hBox,
                    ListTileWidget(
                      title: AppStrings.students,
                      onTap: () {},
                    ),
                    5.hBox,
                    BlocProvider(
                      create: (context) => di.sl<LoginCubit>()..getStudents(),
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) => di.sl<LoginCubit>(),
                        builder: (context, state) {
                          student = LoginCubit.get(context).student;
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
                              return Row(
                                children: [
                                  20.wBox,
                                  ...List.generate(
                                    student!.data!.list!.length,
                                    (index) => StudentWidget(
                                      color: AppColors.white,
                                      photo: student!.data!.list![index].photo!,
                                      name: student!.data!.list![index].name!,
                                      studentClass: student!
                                          .data!.list![index].floor!.name_ar!,
                                      studentCode: student!
                                          .data!.list![index].room!.name_ar!,
                                    ),
                                  ),
                                  10.wBox,
                                ],
                              );
                            }
                          }

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: _body1()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
