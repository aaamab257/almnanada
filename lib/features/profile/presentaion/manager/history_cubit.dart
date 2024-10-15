import 'package:almanada_app/features/auth/data/models/floors_model.dart';
import 'package:almanada_app/features/auth/data/models/onboarding_model.dart';
import 'package:almanada_app/features/auth/data/models/rooms_model.dart';
import 'package:almanada_app/features/profile/data/models/contact_us_model.dart';
import 'package:almanada_app/features/profile/data/models/history_model.dart';
import 'package:almanada_app/features/profile/data/models/notifications_model.dart';
import 'package:almanada_app/features/profile/data/models/setting_model.dart';
import 'package:almanada_app/features/profile/domain/usecase/history_usecase.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryUsecase historyUsecase;

  HistoryCubit({
    required this.historyUsecase,
  }) : super(HistoryInitial());

  static HistoryCubit get(context) => BlocProvider.of(context);

  HistoryModel? historyModel;
  Floors? floorsModel;
  Rooms? roomsModel;
  OnboardingModel? onboardingModel;
  SettingModel? settingModel;
  NotificationsModel? notificationsModel;
  ContactModel? contactModel;
  Future<HistoryModel> getHistory() async {
    emit(HistoryLoading());
    (await historyUsecase.getHistory()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(HistoryError());
    }, (history) {
      historyModel = history;

      emit(HistorySuccess());
    });
    return historyModel!;
  }

  Future<NotificationsModel> getNotifications() async {
    emit(HistoryLoading());
    (await historyUsecase.getNotifications()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(HistoryError());
    }, (history) {
      notificationsModel = history;

      emit(HistorySuccess());
    });
    return notificationsModel!;
  }

  Future<ContactModel> contactus(
      String email, String phone, String sub, String message) async {
    emit(HistoryLoading());
    (await historyUsecase.contactUs(email, phone, sub, message)).fold(
        (failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(HistoryError());
    }, (history) {
      contactModel = history;

      emit(HistorySuccess());
    });
    return contactModel!;
  }

  Future<OnboardingModel> getOnBoarding() async {
    emit(HistoryLoading());
    (await historyUsecase.getOnBoarding()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(HistoryError());
    }, (history) {
      onboardingModel = history;

      emit(HistorySuccess());
    });
    return onboardingModel!;
  }

  Future<SettingModel> getSettings() async {
    emit(HistoryLoading());
    (await historyUsecase.getSettings()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(HistoryError());
    }, (history) {
      settingModel = history;

      emit(HistorySuccess());
    });
    return settingModel!;
  }

  Future<Rooms> getRooms() async {
    emit(HistoryLoading());
    (await historyUsecase.getRooms()).fold((failure) {
      emit(HistoryError());
    }, (history) {
      roomsModel = history;

      emit(HistorySuccess());
    });
    return roomsModel!;
  }

  Future<Floors> getFloors() async {
    emit(HistoryLoading());
    (await historyUsecase.getFloors()).fold((failure) {
      emit(HistoryError());
    }, (floors) {
      floorsModel = floors;

      emit(HistorySuccess());
    });
    return floorsModel!;
  }
}
