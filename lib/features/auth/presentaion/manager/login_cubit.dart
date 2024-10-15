import 'package:almanada_app/features/auth/data/models/distance_school.dart';
import 'package:almanada_app/features/auth/data/models/login_request.dart';
import 'package:almanada_app/features/auth/data/models/login_response.dart';
import 'package:almanada_app/features/auth/data/models/onreach_model.dart';
import 'package:almanada_app/features/auth/data/models/sliders_model.dart';
import 'package:almanada_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_state.dart';
import 'package:almanada_app/features/main/data/models/students_model.dart';
import 'package:almanada_app/features/profile/data/models/callStudent_model.dart';
// import 'dart:math' show cos, sqrt, asin;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({
    required this.loginUseCase,
  }) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isTokenSaved = false;

  String token = "", message = '';
  LoginResponse? loginResponse;
  RegisterResponse? registerResponse;
  LoginResponse? userProfileData, verifiyCodel, changePasswordCodel;
  Student? student;
  Sliders? sliders;
  Position? currentPosition;
  int? callStudentCode,
      callStudentOnReachDistance,
      pickupStudentCode,
      outStudentForParenti;
  DBFASTOSN? dbfastosn;
  OnreachModel? onreachModel;
  CallstudentModelH? callStudentHistory;

  List<String> type = ['parent', 'observer'];
  List<String> typeAR = ['اب', 'مشرف'];
  String selectedType = '';

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    (await loginUseCase.login(loginRequest)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (loginResponseV) {
      debugPrint(loginResponse.toString());
      loginResponse = loginResponseV;

      emit(LoginSuccess());
    });
    return loginResponse!;
  }

  Future<RegisterResponse> register(RegisterRequest loginRequest) async {
    emit(LoginLoading());
    (await loginUseCase.register(loginRequest)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (loginResponseV) {
      debugPrint(loginResponse.toString());
      registerResponse = loginResponseV;

      emit(LoginSuccess());
    });
    return registerResponse!;
  }

  Future<Position> getParentCurrentPosition() async {
    emit(LoginLoading());
    final hasPermission = await _handleLocationPermission();
    hasPermission
        ? await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high)
            .then((Position position) {
            currentPosition = position;
            emit(LoginSuccess());
          }).catchError((e) {
            debugPrint(e);
            emit(LoginError());
          })
        : null;
    return currentPosition!;
  }

  Future<double> calculateDistance(lat1, lon1, lat2, lon2) async {
    var _distanceInMeters = await Geolocator.distanceBetween(
      lat1,
      lon1,
      lat2,
      lon2,
    );

    return _distanceInMeters;
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission? permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ignore: use_build_context_synchronously

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ignore: use_build_context_synchronously

      return false;
    }
    return true;
  }

  Future<String> forgetPassword(String email) async {
    emit(LoginLoading());
    (await loginUseCase.forgetpassword(email)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (msg) {
      debugPrint(loginResponse.toString());
      message = msg;

      emit(LoginSuccess());
    });
    return message;
  }

  Future<LoginResponse> userProfile() async {
    emit(LoginLoading());
    (await loginUseCase.userProfile()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (loginResponseD) {
      debugPrint(loginResponse.toString());
      userProfileData = loginResponseD;

      emit(LoginSuccess());
    });
    return userProfileData!;
  }

  Future<LoginResponse> updateProfile(String name, String address) async {
    emit(LoginLoading());
    (await loginUseCase.updateProfile(name, address)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (loginResponseD) {
      debugPrint(loginResponse.toString());
      userProfileData = loginResponseD;

      emit(LoginSuccess());
    });
    return userProfileData!;
  }

  Future<LoginResponse> verifiyCode(String code) async {
    emit(LoginLoading());
    (await loginUseCase.verifiyCode(code)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (loginResponseD) {
      debugPrint(loginResponse.toString());
      verifiyCodel = loginResponseD;

      emit(LoginSuccess());
    });
    return verifiyCodel!;
  }

  Future<LoginResponse> changePassCode(
      String code, String pass, String conPass) async {
    emit(LoginLoading());
    (await loginUseCase.changepassword(
      code,
      pass,
      conPass,
    ))
        .fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (loginResponseD) {
      debugPrint(loginResponse.toString());
      changePasswordCodel = loginResponseD;

      emit(LoginSuccess());
    });
    return changePasswordCodel!;
  }

  Future<Student> getStudents() async {
    emit(LoginLoading());
    (await loginUseCase.getStudents()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (students) {
      debugPrint(loginResponse.toString());
      student = students;

      emit(LoginSuccess());
    });
    return student!;
  }

  Future<Sliders> getSliders() async {
    emit(LoginLoading());
    (await loginUseCase.getSliders()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (slidersv) {
      debugPrint(loginResponse.toString());
      sliders = slidersv;

      emit(LoginSuccess());
    });
    return sliders!;
  }

  Future<bool> saveToken(String token) async {
    emit(LoginLoading());
    (await loginUseCase.saveToken(token)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (tokenSaved) {
      isTokenSaved = tokenSaved;
      debugPrint("token is saved" + isTokenSaved.toString());
      emit(LoginSuccess());
    });
    await getToken();
    return isTokenSaved;
  }

  Future<String> getToken() async {
    emit(LoginLoading());
    (await loginUseCase.getToken()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (userToken) {
      token = userToken;
      emit(LoginSuccess());
    });
    return token;
  }

  Future<CallstudentModelH> callStudent(int id) async {
    emit(LoginLoading());
    (await loginUseCase.callStudent(id)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (code) {
      debugPrint(loginResponse.toString());
      callStudentHistory = code;

      emit(LoginSuccess());
    });
    return callStudentHistory!;
  }

  Future<OnreachModel> callStudentOnReach(int id) async {
    emit(LoginLoading());
    (await loginUseCase.callStudentOnReachDistance(id)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (code) {
      debugPrint(loginResponse.toString());
      onreachModel = code;

      emit(LoginSuccess());
    });
    return onreachModel!;
  }

  Future<DBFASTOSN> dbFASTOSN() async {
    emit(LoginLoading());
    (await loginUseCase.distanceSchool()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (dbfastosns) {
      debugPrint(loginResponse.toString());
      dbfastosn = dbfastosns;

      emit(LoginSuccess());
    });
    return dbfastosn!;
  }

  Future<int> pickupStudent(int callId, int isPickup) async {
    emit(LoginLoading());
    (await loginUseCase.pickupStudent(callId, isPickup)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (code) {
      debugPrint(loginResponse.toString());
      pickupStudentCode = code;

      emit(LoginSuccess());
    });
    return pickupStudentCode!;
  }

  Future<int> outStudentForParent(int callId) async {
    emit(LoginLoading());
    (await loginUseCase.outStudentForParent(callId)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (code) {
      debugPrint(loginResponse.toString());
      outStudentForParenti = code;

      emit(LoginSuccess());
    });
    return outStudentForParenti!;
  }

  Future<bool> saveType(String token) async {
    emit(LoginLoading());
    (await loginUseCase.savetype(token)).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (tokenSaved) {
      isTokenSaved = tokenSaved;
      debugPrint("token is saved" + isTokenSaved.toString());
      emit(LoginSuccess());
    });
    await getToken();
    return isTokenSaved;
  }

  Future<String> gettype() async {
    emit(LoginLoading());
    (await loginUseCase.gettype()).fold((failure) {
      debugPrint("uuuuuuuuuuu" + failure.toString());
      emit(LoginError());
    }, (userToken) {
      token = userToken;
      emit(LoginSuccess());
    });
    return token;
  }
}
