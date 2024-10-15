import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

class LocaleKeys {
  static const String parentToken = 'parent_token';
  static const String token = 'token';
  static const String lng = 'lng';
  static const String onboarding = 'onboarding';
  static const String loggedIn = 'logged_in';
  static const String email = 'email';
  static const String password = 'password';
}

class LocalDBService {
  final GetStorage _box;
  LocalDBService(this._box);

  static final LocalDBService _to = Get.find<LocalDBService>();
  static LocalDBService get to => _to;

  Future<void> setParentToken(String token) async {
    await _box.write(LocaleKeys.parentToken, token);
  }

  String get getParentToken {
    return _box.read(LocaleKeys.parentToken) ?? '';
  }

  Future<void> setToken(String token) async {
    await _box.write(LocaleKeys.token, token);
  }

  String get getToken {
    return _box.read(LocaleKeys.token) ?? '';
  }

  Future<void> setOnboarding() async {
    await _box.write(LocaleKeys.onboarding, true);
  }

  bool get isSkippedOnboarding {
    return _box.read(LocaleKeys.onboarding) ?? false;
  }

  Future<void> setLoggedIn() async {
    await _box.write(LocaleKeys.loggedIn, true);
  }

  bool get isLoggedIn {
    return _box.read(LocaleKeys.loggedIn) ?? false;
  }

  Future<void> logoutParent() async {
    await _box.remove(LocaleKeys.parentToken);
    await _box.remove(LocaleKeys.loggedIn);
  }

  Future<void> logout() async {
    await _box.remove(LocaleKeys.token);
  }

  Future<void> setSaveEmail(String email) async {
    await _box.write(LocaleKeys.email, email);
  }

  Future<void> setSavePassword(String password) async {
    await _box.write(LocaleKeys.password, password);
  }

  String get getSaveEmail {
    return _box.read(LocaleKeys.email) ?? '';
  }

  String get getSavePassword {
    return _box.read(LocaleKeys.password) ?? '';
  }

  Future<void> removeLoginInformation() async {
    await _box.remove(LocaleKeys.email);
    await _box.remove(LocaleKeys.password);
  }
}
