import 'package:almanada_app/core/error/failures.dart';
import 'package:almanada_app/features/auth/data/models/floors_model.dart';
import 'package:almanada_app/features/auth/data/models/onboarding_model.dart';
import 'package:almanada_app/features/auth/data/models/rooms_model.dart';
import 'package:almanada_app/features/profile/data/models/contact_us_model.dart';

import 'package:almanada_app/features/profile/data/models/history_model.dart';
import 'package:almanada_app/features/profile/data/models/notifications_model.dart';
import 'package:almanada_app/features/profile/data/models/setting_model.dart';
import 'package:almanada_app/features/profile/domain/repo/history_repo.dart';
import 'package:dartz/dartz.dart';

class HistoryUsecase {
  HistoryRepo historyRepo;

  HistoryUsecase({required this.historyRepo});

  Future<Either<Failure, HistoryModel>> getHistory() {
    return historyRepo.getHistory();
  }

  Future<Either<Failure, Rooms>> getRooms() {
    return historyRepo.getRooms();
  }

  Future<Either<Failure, Floors>> getFloors() {
    return historyRepo.getFloors();
  }

  Future<Either<Failure, SettingModel>> getSettings() {
    return historyRepo.getSettings();
  }

  Future<Either<Failure, OnboardingModel>> getOnBoarding() {
    return historyRepo.getOnBoarding();
  }

  Future<Either<Failure, NotificationsModel>> getNotifications() {
    return historyRepo.getNotifications();
  }

  Future<Either<Failure, ContactModel>> contactUs(
      String email, String phone, String sub, String message) {
    return historyRepo.contactUs(email, phone, sub, message);
  }
}
