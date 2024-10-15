import 'package:almanada_app/core/api/network_checker.dart';
import 'package:almanada_app/core/error/failures.dart';
import 'package:almanada_app/features/auth/data/data_source/login_cash_data.dart';
import 'package:almanada_app/features/auth/data/data_source/login_remote_data_source.dart';
import 'package:almanada_app/features/auth/data/models/distance_school.dart';
import 'package:almanada_app/features/auth/data/models/login_request.dart';
import 'package:almanada_app/features/auth/data/models/login_response.dart';
import 'package:almanada_app/features/auth/data/models/onreach_model.dart';
import 'package:almanada_app/features/auth/data/models/sliders_model.dart';
import 'package:almanada_app/features/auth/domain/repo/login_repo.dart';
import 'package:almanada_app/features/main/data/models/students_model.dart';
import 'package:almanada_app/features/profile/data/models/callStudent_model.dart';

import 'package:dartz/dartz.dart';

class LoginRepoImpl implements LoginRepo {
  NetworkInfo networkInfo;
  LoginRemoteDataSource loginRemoteDataSource;
  LoginCasheDataSource loginCasheDataSource;

  LoginRepoImpl(
      {required this.networkInfo,
      required this.loginRemoteDataSource,
      required this.loginCasheDataSource});

  @override
  Future<Either<Failure, LoginResponse>> login(
      LoginRequest loginRequest) async {
    LoginResponse? loginResponse;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.login(loginRequest)).fold((failure) {
        return Left(ServerFailure());
      }, (loginResponseValue) {
        loginResponse = loginResponseValue;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(loginResponse!);
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest loginRequest) async {
    RegisterResponse? loginResponse;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.register(loginRequest)).fold((failure) {
        return Left(ServerFailure());
      }, (loginResponseValue) {
        loginResponse = loginResponseValue;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(loginResponse!);
  }

  @override
  Future<Either<Failure, LoginResponse>> userProfile() async {
    LoginResponse? loginResponse;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.userProfile()).fold((failure) {
        return Left(ServerFailure());
      }, (loginResponseValue) {
        loginResponse = loginResponseValue;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(loginResponse!);
  }

  @override
  Future<Either<Failure, LoginResponse>> updateProfile(
      String name, String address) async {
    LoginResponse? loginResponse;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.updateProfile(name, address)).fold(
          (failure) {
        return Left(ServerFailure());
      }, (loginResponseValue) {
        loginResponse = loginResponseValue;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(loginResponse!);
  }

  @override
  Future<Either<Failure, Student>> getStudents() async {
    Student? student;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.getStudents()).fold((failure) {
        return Left(ServerFailure());
      }, (students) {
        student = students;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(student!);
  }

  @override
  Future<Either<Failure, Sliders>> getSliders() async {
    Sliders? sliders;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.getSliders()).fold((failure) {
        return Left(ServerFailure());
      }, (slidersVa) {
        sliders = slidersVa;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(sliders!);
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String email) async {
    String msg = "";
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.forgetpassword(email)).fold((failure) {
        return Left(ServerFailure());
      }, (message) {
        msg = message;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(msg);
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      String token = await loginCasheDataSource.getToken();
      print("user token ======================= $token");
      return Right(token);
    } catch (_) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveToken(String token) async {
    if (await loginCasheDataSource.saveToken(token: token)) {
      return const Right(true);
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> gettype() async {
    try {
      String token = await loginCasheDataSource.gettype();
      print("user token ======================= $token");
      return Right(token);
    } catch (_) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> savetype(String type) async {
    if (await loginCasheDataSource.savetype(type: type)) {
      return const Right(true);
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, CallstudentModelH>> callStudent(int studentId) async {
    CallstudentModelH? code;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.callStudent(studentId)).fold((failure) {
        return Left(ServerFailure());
      }, (status) {
        code = status;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(code!);
  }

  @override
  Future<Either<Failure, OnreachModel>> callStudentOnReachDistance(
      int studentId) async {
    OnreachModel? code;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.callStudentOnReachDistance(studentId)).fold(
          (failure) {
        return Left(ServerFailure());
      }, (status) {
        code = status;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(code!);
  }

  @override
  Future<Either<Failure, DBFASTOSN>> distanceSchool() async {
    DBFASTOSN? dBFASTOSN;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.dsfatosn()).fold((failure) {
        return Left(ServerFailure());
      }, (dBFASTOSn) {
        dBFASTOSN = dBFASTOSn;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(dBFASTOSN!);
  }

  @override
  Future<Either<Failure, int>> pickupStudent(int callId, int isPickup) async {
    // TODO: implement pickupStudent
    int? code;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.pickupStudent(callId, isPickup)).fold(
          (failure) {
        return Left(ServerFailure());
      }, (status) {
        code = status;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(code!);
  }

  @override
  Future<Either<Failure, int>> outStudentForParent(int callId) async {
    // TODO: implement pickupStudent
    int? code;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.outStudentForParent(callId)).fold((failure) {
        return Left(ServerFailure());
      }, (status) {
        code = status;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(code!);
  }

  @override
  Future<Either<Failure, LoginResponse>> changePasswordCode(
      String code, String pass, String conPass) async {
    LoginResponse? loginResponse;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.changePasswordCode(code, pass, conPass))
          .fold((failure) {
        return Left(ServerFailure());
      }, (loginResponseValue) {
        loginResponse = loginResponseValue;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(loginResponse!);
  }

  @override
  Future<Either<Failure, LoginResponse>> verifiyCode(String code) async {
    LoginResponse? loginResponse;
    if (await networkInfo.isConnected) {
      (await loginRemoteDataSource.verifiyCode(code)).fold((failure) {
        return Left(ServerFailure());
      }, (loginResponseValue) {
        loginResponse = loginResponseValue;
      });
    } else {
      return Left(NetworkFailure());
    }
    return Right(loginResponse!);
  }
}
