import 'package:almanada_app/core/widgets/custom_snakbar.dart';
import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/main/presentaion/widgets/card_notification_widget.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:almanada_app/features/profile/data/models/notifications_model.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationsModel? notificationsModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<HistoryCubit>()..getNotifications(),
      child: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) => di.sl<HistoryCubit>(),
        builder: (context, state) {
          notificationsModel = HistoryCubit.get(context).notificationsModel;
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    25.hBox,
                    ...List.generate(
                        notificationsModel!
                            .notificationsData!.notificationsItem!.length,
                        (index) => CardNotificationWidget(
                              parent_pickup_time: notificationsModel!
                                  .notificationsData!
                                  .notificationsItem![index]
                                  .callstudent!
                                  .parent_pickup_time,
                              disc: notificationsModel!.notificationsData!
                                  .notificationsItem![index].message,
                              title: notificationsModel!.notificationsData!
                                  .notificationsItem![index].title,
                              image: notificationsModel!.notificationsData!
                                  .notificationsItem![index].photo,
                              onPressed: () {
                                di
                                    .sl<LoginCubit>()
                                    .pickupStudent(
                                        notificationsModel!
                                            .notificationsData!
                                            .notificationsItem![index]
                                            .callstudent!
                                            .id!,
                                        1)
                                    .then((onValue) {
                                  if (onValue == 200) {
                                    showSnackBar(
                                        context, "تم تأكيد استلام الطالب");
                                    setState(() {
                                      notificationsModel!
                                          .notificationsData!.notificationsItem!
                                          .removeAt(index);
                                    });
                                  }
                                });
                              },
                            )),
                  ],
                ),
              );
            }
          }

          return Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Align(
                  alignment: AlignmentDirectional.center, child: _body1()),
            ),
          );
        },
      ),
    );
  }
}
// ListView.separated(
//         itemCount: 3,
//         addAutomaticKeepAlives: false,
//         addRepaintBoundaries: false,
//         physics: const AlwaysScrollableScrollPhysics(),
//         padding: paddingExt(start: 20, top: 15, end: 20, bottom: 15),
//         itemBuilder: (context, index) => const CardNotificationWidget(),
//         separatorBuilder: (context, index) => const Divider(),
//       ),
