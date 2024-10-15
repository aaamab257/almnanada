import 'package:almanada_app/core/widgets/error_widgts.dart';
import 'package:almanada_app/core/widgets/loading_screen.dart';
import 'package:almanada_app/features/profile/data/models/history_model.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';
import 'package:almanada_app/features/profile/presentaion/widgets/history_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almanada_app/di.dart' as di;

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryModel? historyModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                  ...List.generate(
                    historyModel!.data!.callstudent!.length,
                    (index) => HistoryItem(
                      date: historyModel!.data!.callstudent![index].date ?? "",
                      studentName: historyModel!
                              .data!.callstudent![index].student!.name ??
                          "",
                      callTime:
                          historyModel!.data!.callstudent![index].callTime ??
                              "",
                      observer: historyModel!
                              .data!.callstudent![index].observer!.name ??
                          "",
                      floor: historyModel!
                              .data!.callstudent![index].floor!.name_ar ??
                          "",
                      outTime:
                          historyModel!.data!.callstudent![index].outTime ?? "",
                      waitingTime:
                          historyModel!.data!.callstudent![index].waitingTime ??
                              "",
                      room: historyModel!
                              .data!.callstudent![index].room!.name_ar ??
                          "",
                      pickupTime:
                          historyModel!.data!.callstudent![index].pickupTime ??
                              "",
                    ),
                  ),
                ],
              );
            }
          }

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Align(
                    alignment: AlignmentDirectional.center, child: _body1()),
              ),
            ),
          );
        },
      ),
    );
  }
}
// SingleChildScrollView(
//         child: Column(
//           children: [
//             ...List.generate(
//               2,
//               (index) => const HistoryItem(),
//             ),
//           ],
//         ),
//       ),
