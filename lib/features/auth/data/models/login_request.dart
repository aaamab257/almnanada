class LoginRequest {
  String email;
  String password;
  String deviceToken;

  LoginRequest(
      {required this.email, required this.password, required this.deviceToken});
}

class RegisterRequest {
  String email;
  String password;
  String name;

  String type;
  String phone;

  RegisterRequest(
      {required this.email,
      required this.password,
      required this.type,
      required this.phone,
      required this.name});
}
