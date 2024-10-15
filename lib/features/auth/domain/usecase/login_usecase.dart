import 'package:almanada_app/core/error/failures.dart';
import 'package:almanada_app/features/auth/data/models/distance_school.dart';
import 'package:almanada_app/features/auth/data/models/login_request.dart';
import 'package:almanada_app/features/auth/data/models/login_response.dart';
import 'package:almanada_app/features/auth/data/models/onreach_model.dart';
import 'package:almanada_app/features/auth/data/models/sliders_model.dart';
import 'package:almanada_app/features/auth/domain/repo/login_repo.dart';
import 'package:almanada_app/features/main/data/models/students_model.dart';
import 'package:almanada_app/features/profile/data/models/callStudent_model.dart';

import 'package:dartz/dartz.dart';

class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest) {
    return loginRepo.login(loginRequest);
  }

  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest loginRequest) {
    return loginRepo.register(loginRequest);
  }

  Future<Either<Failure, LoginResponse>> userProfile() {
    return loginRepo.userProfile();
  }

  Future<Either<Failure, LoginResponse>> updateProfile(
      String name, String address) {
    return loginRepo.updateProfile(name, address);
  }

  Future<Either<Failure, LoginResponse>> verifiyCode(String code) {
    return loginRepo.verifiyCode(code);
  }

  Future<Either<Failure, LoginResponse>> changepassword(
      String code, String pass, String conPass) {
    return loginRepo.changePasswordCode(code, pass, conPass);
  }

  Future<Either<Failure, String>> forgetpassword(String email) {
    return loginRepo.forgetPassword(email);
  }

  Future<Either<Failure, bool>> saveToken(String token) {
    return loginRepo.saveToken(token);
  }

  Future<Either<Failure, String>> getToken() {
    return loginRepo.getToken();
  }

  Future<Either<Failure, bool>> savetype(String type) {
    return loginRepo.savetype(type);
  }

  Future<Either<Failure, String>> gettype() {
    return loginRepo.gettype();
  }

  Future<Either<Failure, Student>> getStudents() {
    return loginRepo.getStudents();
  }

  Future<Either<Failure, Sliders>> getSliders() {
    return loginRepo.getSliders();
  }

  Future<Either<Failure, CallstudentModelH>> callStudent(int studentId) {
    return loginRepo.callStudent(studentId);
  }

  Future<Either<Failure, OnreachModel>> callStudentOnReachDistance(
      int studentId) {
    return loginRepo.callStudentOnReachDistance(studentId);
  }

  Future<Either<Failure, DBFASTOSN>> distanceSchool() {
    return loginRepo.distanceSchool();
  }

  Future<Either<Failure, int>> pickupStudent(int callId, int isPickup) {
    return loginRepo.pickupStudent(callId, isPickup);
  }

  Future<Either<Failure, int>> outStudentForParent(int callId) {
    return loginRepo.outStudentForParent(callId);
  }
}
