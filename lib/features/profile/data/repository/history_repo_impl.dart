import 'package:almanada_app/core/api/network_checker.dart';
import 'package:almanada_app/core/error/failures.dart';
import 'package:almanada_app/features/auth/data/models/floors_model.dart';
import 'package:almanada_app/features/auth/data/models/onboarding_model.dart';
import 'package:almanada_app/features/auth/data/models/rooms_model.dart';

import 'package:almanada_app/features/profile/data/data_source/remote_data_source.dart';
import 'package:almanada_app/features/profile/data/models/contact_us_model.dart';
import 'package:almanada_app/features/profile/data/models/history_model.dart';
import 'package:almanada_app/features/profile/data/models/notifications_model.dart';
import 'package:almanada_app/features/profile/data/models/setting_model.dart';
import 'package:almanada_app/features/profile/domain/repo/history_repo.dart';
import 'package:dartz/dartz.dart';

class HistoryRepoImpl implements HistoryRepo {
  NetworkInfo networkInfo;
  HistoryRemoteDataSource historyRemoteDataSource;

  HistoryRepoImpl({
    required this.networkInfo,
    required this.historyRemoteDataSource,
  });

  @override
  Future<Either<Failure, HistoryModel>> getHistory() async {
    HistoryModel? historyModel;
    if (await networkInfo.isConnected) {
      (await historyRemoteDataSource.getHistory()).fold((failure) {
        return Left(ServerFailure());
      }, (history) {
        historyModel = history;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(historyModel!);
  }

  @override
  Future<Either<Failure, Floors>> getFloors() async {
    Floors? floorsModel;
    if (await networkInfo.isConnected) {
      (await historyRemoteDataSource.getFloors()).fold((failure) {
        return Left(ServerFailure());
      }, (floors) {
        floorsModel = floors;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(floorsModel!);
  }

  @override
  Future<Either<Failure, Rooms>> getRooms() async {
    Rooms? roomsModel;
    if (await networkInfo.isConnected) {
      (await historyRemoteDataSource.getRooms()).fold((failure) {
        return Left(ServerFailure());
      }, (rooms) {
        roomsModel = rooms;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(roomsModel!);
  }

  @override
  Future<Either<Failure, OnboardingModel>> getOnBoarding() async {
    OnboardingModel? onboardingModel;
    if (await networkInfo.isConnected) {
      (await historyRemoteDataSource.getOnBoarding()).fold((failure) {
        return Left(ServerFailure());
      }, (onBoarding) {
        onboardingModel = onBoarding;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(onboardingModel!);
  }

  @override
  Future<Either<Failure, SettingModel>> getSettings() async {
    SettingModel? settingModel;
    if (await networkInfo.isConnected) {
      (await historyRemoteDataSource.getSettings()).fold((failure) {
        return Left(ServerFailure());
      }, (settingModelValue) {
        settingModel = settingModelValue;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(settingModel!);
  }

  @override
  Future<Either<Failure, NotificationsModel>> getNotifications() async {
    NotificationsModel? onboardingModel;
    if (await networkInfo.isConnected) {
      (await historyRemoteDataSource.getNotifications()).fold((failure) {
        return Left(ServerFailure());
      }, (onBoarding) {
        onboardingModel = onBoarding;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(onboardingModel!);
  }

  @override
  Future<Either<Failure, ContactModel>> contactUs(
      String email, String phone, String sub, String message) async {
    ContactModel? onboardingModel;
    if (await networkInfo.isConnected) {
      (await historyRemoteDataSource.contactUs(email, phone, sub, message))
          .fold((failure) {
        return Left(ServerFailure());
      }, (contactUs) {
        onboardingModel = contactUs;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(onboardingModel!);
  }
}
