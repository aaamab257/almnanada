import 'package:almanada_app/core/error/failures.dart';
import 'package:almanada_app/features/auth/data/models/floors_model.dart';
import 'package:almanada_app/features/auth/data/models/onboarding_model.dart';
import 'package:almanada_app/features/auth/data/models/rooms_model.dart';
import 'package:almanada_app/features/profile/data/models/contact_us_model.dart';

import 'package:almanada_app/features/profile/data/models/history_model.dart';
import 'package:almanada_app/features/profile/data/models/notifications_model.dart';
import 'package:almanada_app/features/profile/data/models/setting_model.dart';
import 'package:dartz/dartz.dart';

abstract class HistoryRepo {
  Future<Either<Failure, HistoryModel>> getHistory();
  Future<Either<Failure, Floors>> getFloors();
  Future<Either<Failure, Rooms>> getRooms();
  Future<Either<Failure, NotificationsModel>> getNotifications();
  Future<Either<Failure, OnboardingModel>> getOnBoarding();
  Future<Either<Failure, SettingModel>> getSettings();
  Future<Either<Failure, ContactModel>> contactUs(
    String email,
    String phone,
    String sub,
    String message,
  );
}
