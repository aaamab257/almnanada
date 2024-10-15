import 'package:almanada_app/core/api/api_consumer.dart';
import 'package:almanada_app/core/api/end_points.dart';
import 'package:almanada_app/core/error/failures.dart';
import 'package:almanada_app/features/auth/data/models/floors_model.dart';
import 'package:almanada_app/features/auth/data/models/onboarding_model.dart';
import 'package:almanada_app/features/auth/data/models/rooms_model.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/profile/data/models/contact_us_model.dart';

import 'package:almanada_app/features/profile/data/models/history_model.dart';
import 'package:almanada_app/features/profile/data/models/notifications_model.dart';
import 'package:almanada_app/features/profile/data/models/setting_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:almanada_app/di.dart' as di;

abstract class HistoryRemoteDataSource {
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

class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  ApiConsumer apiConsumer;

  HistoryRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<Failure, HistoryModel>> getHistory() async {
    String token = "";
    await di.sl<LoginCubit>().getToken().then((value) {
      token = value;
      print('token ============= $value');
    });
    Map<String, dynamic> response = await apiConsumer.post(
        EndPoints.callstudentHistory + token,
        {},
        Options(
          headers: {
            'Accept-Language': "en",
          },
        ));
    List<dynamic> data = response["data"]['callstudent'];
    List<CallStudent> allHistory =
        data.map((historyData) => CallStudent.fromJson(historyData)).toList();

    HistoryModel student = HistoryModel(
        status: response["status"],
        msg: response["msg"],
        data: HistoryData(callstudent: allHistory));

    return right(student);
  }

  @override
  Future<Either<Failure, Floors>> getFloors() async {
    String token = "";
    await di.sl<LoginCubit>().getToken().then((value) {
      token = value;
      print('token ============= $value');
    });
    Map<String, dynamic> response = await apiConsumer.post(
        EndPoints.observerFloors + token,
        {},
        Options(
          headers: {
            'Accept-Language': "en",
          },
        ));
    List<dynamic> data = response["data"]['floors'];
    List<FloorDetails> allFloors =
        data.map((historyData) => FloorDetails.fromJson(historyData)).toList();

    Floors floors = Floors(
        status: response["status"],
        msg: response["msg"],
        data: FloorsData(list: allFloors));

    return right(floors);
  }

  @override
  Future<Either<Failure, Rooms>> getRooms() async {
    String token = "";
    await di.sl<LoginCubit>().getToken().then((value) {
      token = value;
      print('token ============= $value');
    });
    Map<String, dynamic> response = await apiConsumer.post(
        EndPoints.observerRooms + token,
        {},
        Options(
          headers: {
            'Accept-Language': "en",
          },
        ));
    List<dynamic> data = response["data"]['rooms'];
    List<RoomDetails> allFloors =
        data.map((historyData) => RoomDetails.fromJson(historyData)).toList();

    Rooms rooms = Rooms(
        status: response["status"],
        msg: response["msg"],
        data: RoomsData(list: allFloors));

    return right(rooms);
  }

  @override
  Future<Either<Failure, OnboardingModel>> getOnBoarding() async {
    Map<String, dynamic> response = await apiConsumer.post(
        EndPoints.onBoarding,
        {},
        Options(
          headers: {
            'Accept-Language': "en",
          },
        ));
    List<dynamic> data = response["data"]['onboarding'];
    List<OnboardingDetails> allOnboarding = data
        .map((historyData) => OnboardingDetails.fromJson(historyData))
        .toList();

    OnboardingModel onboardingModel = OnboardingModel(
        status: response["status"],
        msg: response["msg"],
        data: OnboardingData(onboardingDetails: allOnboarding));

    return right(onboardingModel);
  }

  @override
  Future<Either<Failure, SettingModel>> getSettings() async {
    try {
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.settings,
          {},
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));

      SettingModel loginResponse = SettingModel(
        status: response["status"],
        msg: response["msg"],
        data: SettingModelData(
          name_ar: response["data"]['name'],
          address_ar: response["data"]['address'],
          linkedin_link: response["data"]['linkedin_link'],
          phone: response["data"]['phone'],
          facebook_link: response["data"]['facebook_link'],
          about_desc_ar: response["data"]['about_desc'],
          about_img_ar: response["data"]['about_img'],
          about_title_ar: response["data"]['about_title'],
          login_app_img: response["data"]['login_app_img'],
          logo: response["data"]['logo'],
          twitter_link: response["data"]['twitter_link'],
          fivacon: response["data"]['Fivacon'],
          email: response["data"]['email'],
          instagram_link: response["data"]['insta_link'],
          tiktok: response["data"]['TikTokLink'],
          splashScreenImg: response['data']['splashscreen'],
          snap: response['data']['snapchat_link'],
          Whatsapp_link: response['data']['Whatsapp_link'],
        ),
      );

      return right(loginResponse);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, NotificationsModel>> getNotifications() async {
    String token = "";
    await di.sl<LoginCubit>().getToken().then((value) {
      token = value;
      print('token ============= $value');
    });
    Map<String, dynamic> response = await apiConsumer.get(
        EndPoints.notifications + token,
        Options(
          headers: {
            'Accept-Language': "en",
          },
        ));
    List<dynamic> data = response["data"]['PushNotification'];
    List<NotificationItem> allHistory = data
        .map((historyData) => NotificationItem.fromJson(historyData))
        .toList();

    NotificationsModel student = NotificationsModel(
        status: response["status"],
        msg: response["msg"],
        notificationsData: NotificationsData(notificationsItem: allHistory));

    return right(student);
  }

  @override
  Future<Either<Failure, ContactModel>> contactUs(
    String email,
    String phone,
    String sub,
    String message,
  ) async {
    String token = "";
    await di.sl<LoginCubit>().getToken().then((value) {
      token = value;
      print('token ============= $value');
    });

    Map<String, dynamic> response = await apiConsumer.post(
        EndPoints.contactUs + token,
        {
          "email": email,
          "phone": phone,
          "subject": sub,
          "message": message,
        },
        Options(
          headers: {
            'Accept-Language': "en",
          },
        ));

    ContactModel contactModel = ContactModel(
      msg: response["msg"],
      code: response["status"],
    );

    return right(contactModel);
  }
}
