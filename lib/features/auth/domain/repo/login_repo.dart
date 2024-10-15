import 'package:almanada_app/core/error/failures.dart';
import 'package:almanada_app/features/auth/data/models/distance_school.dart';
import 'package:almanada_app/features/auth/data/models/login_request.dart';
import 'package:almanada_app/features/auth/data/models/login_response.dart';
import 'package:almanada_app/features/auth/data/models/onreach_model.dart';
import 'package:almanada_app/features/auth/data/models/sliders_model.dart';
import 'package:almanada_app/features/main/data/models/students_model.dart';
import 'package:almanada_app/features/profile/data/models/callStudent_model.dart';

import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest);
  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, LoginResponse>> userProfile();
  Future<Either<Failure, LoginResponse>> updateProfile(
      String name, String address);
  Future<Either<Failure, LoginResponse>> verifiyCode(String code);
  Future<Either<Failure, LoginResponse>> changePasswordCode(
      String code, String pass, String conPass);
  Future<Either<Failure, String>> forgetPassword(String email);
  // cash data to save token
  Future<Either<Failure, bool>> saveToken(String token);

  Future<Either<Failure, String>> getToken();

  Future<Either<Failure, bool>> savetype(String token);

  Future<Either<Failure, String>> gettype();
  Future<Either<Failure, Student>> getStudents();
  Future<Either<Failure, Sliders>> getSliders();

  Future<Either<Failure, OnreachModel>> callStudentOnReachDistance(
      int studentId);
  Future<Either<Failure, CallstudentModelH>> callStudent(int studentId);
  Future<Either<Failure, int>> pickupStudent(int callId, int isPickup);
  Future<Either<Failure, int>> outStudentForParent(
    int callId,
  );
  Future<Either<Failure, DBFASTOSN>> distanceSchool();
}
