import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';

import 'package:almanada_app/di.dart' as di;
import 'package:almanada_app/features/main/presentaion/widgets/notification_observer_item.dart';
import 'package:almanada_app/features/profile/data/models/notifications_model.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ObserverNotificationPage extends StatefulWidget {
  const ObserverNotificationPage({super.key});

  @override
  State<ObserverNotificationPage> createState() =>
      _ObserverNotificationPageState();
}

class _ObserverNotificationPageState extends State<ObserverNotificationPage> {
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
                        (index) => ObserverCardNotificationWidget(
                              disc: notificationsModel!.notificationsData!
                                  .notificationsItem![index].message,
                              title: notificationsModel!.notificationsData!
                                  .notificationsItem![index].title,
                              image: notificationsModel!.notificationsData!
                                  .notificationsItem![index].photo,
                              onPressed: () {},
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
