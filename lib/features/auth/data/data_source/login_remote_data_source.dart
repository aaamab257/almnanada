import 'package:almanada_app/core/api/api_consumer.dart';
import 'package:almanada_app/core/api/end_points.dart';
import 'package:almanada_app/core/error/failures.dart';
import 'package:almanada_app/features/auth/data/models/distance_school.dart';
import 'package:almanada_app/features/auth/data/models/login_request.dart';
import 'package:almanada_app/features/auth/data/models/login_response.dart';
import 'package:almanada_app/features/auth/data/models/onreach_model.dart';
import 'package:almanada_app/features/auth/data/models/sliders_model.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/main/data/models/students_model.dart';
import 'package:almanada_app/features/profile/data/models/callStudent_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:almanada_app/di.dart' as di;

abstract class LoginRemoteDataSource {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);

  Future<Either<Failure, RegisterResponse>> register(RegisterRequest request);
  Future<Either<Failure, LoginResponse>> userProfile();
  Future<Either<Failure, LoginResponse>> updateProfile(
      String name, String address);
  Future<Either<Failure, LoginResponse>> verifiyCode(
    String code,
  );
  Future<Either<Failure, LoginResponse>> changePasswordCode(
    String code,
    String pass,
    String conPass,
  );
  Future<Either<Failure, String>> forgetpassword(String email);
  Future<Either<Failure, Student>> getStudents();
  Future<Either<Failure, Sliders>> getSliders();

  Future<Either<Failure, OnreachModel>> callStudentOnReachDistance(
      int studentId);
  Future<Either<Failure, CallstudentModelH>> callStudent(int studentId);
  Future<Either<Failure, int>> pickupStudent(int callId, int isPickup);
  Future<Either<Failure, DBFASTOSN>> dsfatosn();

  //Observer
  Future<Either<Failure, int>> outStudentForParent(int callId);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  ApiConsumer apiConsumer;

  LoginRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try {
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.login,
          {
            "email": request.email,
            "password": request.password,
            "device_token": request.deviceToken
          },
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));

      LoginResponse loginResponse = LoginResponse.fromJson(response);

      return right(loginResponse);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest request) async {
    try {
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.register,
          {
            "email": request.email,
            "password": request.password,
            "type": request.type,
            "phone": request.phone,
            "name": request.name,
          },
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));
      RegisterResponse registerResponse = RegisterResponse.fromJson(response);

      return right(registerResponse);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, String>> forgetpassword(String email) async {
    try {
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.forgetPassword,
          {
            "email": email,
          },
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));

      String msg = response['msg'];

      print("Tokeeeeeeeeeeeeeeeeeeeeeeeeeeeeen ====================== > $msg");

      return right(msg);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, LoginResponse>> userProfile() async {
    try {
      String token = "";
      await di.sl<LoginCubit>().getToken().then((value) {
        token = value;
        print('token ============= $value');
      });
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.myProfile + token,
          {},
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));

      LoginResponse loginResponse = LoginResponse.fromJson(response);

      print(
          "Tokeeeeeeeeeeeeeeeeeeeeeeeeeeeeen ====================== > $token");

      return right(loginResponse);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Student>> getStudents() async {
    String token = "";
    await di.sl<LoginCubit>().getToken().then((value) {
      token = value;
      print('token ============= $value');
    });
    Map<String, dynamic> response = await apiConsumer.post(
        EndPoints.homeStudent + token,
        {},
        Options(
          headers: {
            'Accept-Language': "en",
          },
        ));
    List<dynamic> data = response["data"]['students'];
    List<StudentDetails> allStudents = data
        .map((studentData) => StudentDetails.fromJson(studentData))
        .toList();

    Student student = Student(
        status: response["status"],
        msg: response["msg"],
        data: StudentData(list: allStudents));

    return right(student);
  }

  @override
  Future<Either<Failure, Sliders>> getSliders() async {
    String token = "";
    await di.sl<LoginCubit>().getToken().then((value) {
      token = value;
      print('token ============= $value');
    });
    Map<String, dynamic> response = await apiConsumer.post(
        EndPoints.homeSlider + token,
        {},
        Options(
          headers: {
            'Accept-Language': "en",
          },
        ));
    List<dynamic> data = response["data"]['Sliders'];
    List<SlidersList> allSliders =
        data.map((studentData) => SlidersList.fromJson(studentData)).toList();

    Sliders student = Sliders(
        status: response["status"],
        msg: response["msg"],
        data: DataSlider(list: allSliders));

    return right(student);
  }

  @override
  Future<Either<Failure, CallstudentModelH>> callStudent(int studentId) async {
    try {
      String token = "";
      await di.sl<LoginCubit>().getToken().then((value) {
        token = value;
      });
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.callStudent + token,
          {"studend_id": studentId},
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));
      CallstudentModelH callStudentModel = CallstudentModelH(
        status: response["status"],
        msg: response["msg"],
        data: CallStudentData(
          id: response["data"]['id'] ?? 0,
          pickupTime: response["data"]['parent_pickup_time'] ?? "",
          waitingTime: response["data"]['parent_waiting_time'] ?? "",
          callTime: response["data"]['parent_call_time'] ?? "",
          is_student_out_for_parent:
              response["data"]['is_parent_pickup_student'] ?? "",
          outTime: response["data"]['student_out_for_parent_time'],
        ),
      );

      return right(callStudentModel);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, OnreachModel>> callStudentOnReachDistance(
      int studentId) async {
    try {
      String token = "";
      await di.sl<LoginCubit>().getToken().then((value) {
        token = value;
      });
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.callStudentOnReachDistance + token,
          {"studend_id": studentId},
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));

      OnreachModel onreachModel = OnreachModel(
          status: response['status'],
          msg: response['msg'],
          data: DataOnReach(id: response['data']['id']));

      return right(onreachModel);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, DBFASTOSN>> dsfatosn() async {
    try {
      String token = "";
      await di.sl<LoginCubit>().getToken().then((value) {
        token = value;
        print('token ============= $value');
      });
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.dBFASTOSN + token,
          {},
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));
      DBFASTOSN dbfastosn = DBFASTOSN(
          status: response['status'],
          msg: response['msg'],
          data: DistanceSchool(
              id: response['data']['id'],
              name: response['data']['name'],
              lat: response['data']['lat'],
              long: response['data']['long'],
              dBFASTOSN: response['data']['DBFASTOSN']));

      print(
          "Tokeeeeeeeeeeeeeeeeeeeeeeeeeeeeen ====================== > $token");

      return right(dbfastosn);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, int>> pickupStudent(int callId, int isPickup) async {
    try {
      String token = "";
      await di.sl<LoginCubit>().getToken().then((value) {
        token = value;
      });
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.parent_pickup_student + token,
          {"callstudent_id": callId, "is_parent_pickup_student": 1},
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));
      int code = response['status'];

      return right(code);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, int>> outStudentForParent(int callId) async {
    try {
      String token = "";
      await di.sl<LoginCubit>().getToken().then((value) {
        token = value;
      });
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.student_out_for_parent + token,
          {"callstudent_id": callId, "is_student_out_for_parent": 1},
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));
      int code = response['status'];

      return right(code);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, LoginResponse>> changePasswordCode(
    String code,
    String pass,
    String conPass,
  ) async {
    try {
      String token = "";
      await di.sl<LoginCubit>().getToken().then((value) {
        token = value;
        print('token ============= $value');
      });
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.changePasswordCode,
          {
            "code": code,
            "password": pass,
            "password_confirmation": conPass,
          },
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));

      // LoginResponse loginResponse = LoginResponse(
      //   status: response["status"],
      //   msg: response["msg"],
      //   data: LoginData(
      //     id: response["data"]['id'],
      //     name: response["data"]['name'],
      //     type: response["data"]['type'],
      //     phone: response["data"]['phone'],
      //     photo: response["data"]['photo'],
      //     username: response["data"]['username'],
      //     token: response["data"]['api_token'],
      //     email: response["data"]['email'],
      //     address: response["data"]['address'],
      //   ),
      // );

      print(
          "Tokeeeeeeeeeeeeeeeeeeeeeeeeeeeeen ====================== > $token");

      return right(LoginResponse.fromJson(response));
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, LoginResponse>> verifiyCode(
    String code,
  ) async {
    try {
      String token = "";
      await di.sl<LoginCubit>().getToken().then((value) {
        token = value;
        print('token ============= $value');
      });
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.verifyCode,
          {
            "code": code,
          },
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));

      LoginResponse loginResponse = LoginResponse(
        status: response["status"],
        msg: response["msg"],
        data: LoginData(
          id: response["data"]['id'],
          name: response["data"]['name'],
          type: response["data"]['type'],
          phone: response["data"]['phone'],
          photo: response["data"]['photo'],
          username: response["data"]['username'],
          token: response["data"]['api_token'],
          email: response["data"]['email'],
          address: response["data"]['address'],
        ),
      );

      print(
          "Tokeeeeeeeeeeeeeeeeeeeeeeeeeeeeen ====================== > $token");

      return right(loginResponse);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, LoginResponse>> updateProfile(
      String name, String address) async {
    try {
      String token = "";
      await di.sl<LoginCubit>().getToken().then((value) {
        token = value;
        print('token ============= $value');
      });
      Map<String, dynamic> response = await apiConsumer.post(
          EndPoints.updateProfile + token,
          {"name": name, "address": address},
          Options(
            headers: {
              'Accept-Language': "en",
            },
          ));

      LoginResponse loginResponse = LoginResponse.fromJson(response);

      print(
          "Tokeeeeeeeeeeeeeeeeeeeeeeeeeeeeen ====================== > $token");

      return right(loginResponse);
    } on Exception catch (e) {
      print(e.toString());
    }
    return Left(ServerFailure());
  }
}
