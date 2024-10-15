import 'package:almanada_app/core/widgets/custom_snakbar.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/features/auth/data/models/floors_model.dart';
import 'package:almanada_app/features/auth/data/models/rooms_model.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/main/presentaion/widgets/floors_widget.dart';
import 'package:almanada_app/features/main/presentaion/widgets/list_tile_widget.dart';
import 'package:almanada_app/features/main/presentaion/widgets/rooms_widget.dart';
import 'package:almanada_app/features/profile/data/models/history_model.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';
import 'package:almanada_app/features/profile/presentaion/widgets/observer_history.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almanada_app/di.dart' as di;

class ObserverScreen extends StatefulWidget {
  const ObserverScreen({super.key});

  @override
  State<ObserverScreen> createState() => _ObserverScreenState();
}

class _ObserverScreenState extends State<ObserverScreen> {
  Rooms? rooms;
  Floors? floors;
  HistoryModel? historyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTileWidget(
              title: AppStrings.floors,
              onTap: () {},
            ),
            5.hBox,
            BlocProvider(
              create: (context) => di.sl<HistoryCubit>()..getFloors(),
              child: BlocConsumer<HistoryCubit, HistoryState>(
                listener: (context, state) => di.sl<HistoryCubit>(),
                builder: (context, state) {
                  floors = HistoryCubit.get(context).floorsModel;
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
                      return Row(
                        children: [
                          20.wBox,
                          ...List.generate(
                            floors!.data!.list!.length,
                            (index) => FloorsWidget(
                              name: floors!.data!.list![index].name!,
                              photo: floors!.data!.list![index].photo!,
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
            ListTileWidget(
              title: AppStrings.rooms,
              onTap: () {},
            ),
            5.hBox,
            BlocProvider(
              create: (context) => di.sl<HistoryCubit>()..getRooms(),
              child: BlocConsumer<HistoryCubit, HistoryState>(
                listener: (context, state) => di.sl<HistoryCubit>(),
                builder: (context, state) {
                  rooms = HistoryCubit.get(context).roomsModel;
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
                      return Row(
                        children: [
                          20.wBox,
                          ...List.generate(
                            rooms!.data!.list!.length,
                            (index) => RoomsWidget(
                              name: rooms!.data!.list![index].name!,
                              photo: rooms!.data!.list![index].photo!,
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
            3.hBox,
            BlocProvider(
              create: (context) => di.sl<HistoryCubit>()..getHistory(),
              child: BlocConsumer<HistoryCubit, HistoryState>(
                listener: (context, state) => di.sl<HistoryCubit>(),
                builder: (context, state) {
                  historyModel = HistoryCubit.get(context).historyModel;
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
                          ListTileWidget(
                            title: "طلبات المناداه",
                            onTap: () {},
                          ),
                          ...List.generate(
                            historyModel!.data!.callstudent!.length,
                            (index) => historyModel!
                                        .data!.callstudent![index].outTime ==
                                    null
                                ? ObserverHistoryItem(
                                    name: historyModel!.data!
                                        .callstudent![index].student!.name,
                                    callTime: historyModel!.data!
                                            .callstudent![index].callTime ??
                                        "",
                                    observer: historyModel!
                                            .data!
                                            .callstudent![index]
                                            .observer!
                                            .name ??
                                        "",
                                    floor: historyModel!
                                            .data!
                                            .callstudent![index]
                                            .floor!
                                            .name_ar ??
                                        "",
                                    outTime: historyModel!.data!
                                            .callstudent![index].outTime ??
                                        "",
                                    waitingTime: historyModel!.data!
                                            .callstudent![index].waitingTime ??
                                        "",
                                    room: historyModel!
                                            .data!
                                            .callstudent![index]
                                            .room!
                                            .name_ar ??
                                        "",
                                    pickupTime: historyModel!.data!
                                            .callstudent![index].pickupTime ??
                                        "",
                                    onPressed: () {
                                      di
                                          .sl<LoginCubit>()
                                          .outStudentForParent(historyModel!
                                              .data!.callstudent![index].id!)
                                          .then((onValue) {
                                        if (onValue == 200) {
                                          showSnackBar(
                                              context, "تم خروج الطالب بنجاح");
                                          setState(() {
                                            historyModel!.data!.callstudent!
                                                .removeAt(index);
                                          });
                                        }
                                      });
                                    },
                                  )
                                : const SizedBox(),
                          ),
                        ],
                      );
                    }
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Align(
                        alignment: AlignmentDirectional.center,
                        child: _body1()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
