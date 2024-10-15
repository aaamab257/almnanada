import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../core/error/exception.dart';

abstract class LoginCasheDataSource {
  Future<bool> saveToken({required String token});
  Future<String> getToken();
  Future<bool> savetype({required String type});
  Future<String> gettype();
}

class LoginCasheDataSourceImpl implements LoginCasheDataSource {
  SharedPreferences sharedPreferences;
  final String cacheKey = "token";
  final String typeKey = "type";

  LoginCasheDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getToken() async {
    if (sharedPreferences.getString(cacheKey) != null) {
      return await sharedPreferences.getString(cacheKey)!;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> saveToken({required String token}) async {
    return await sharedPreferences.setString(cacheKey, token);
  }

  @override
  Future<String> gettype() async {
    if (sharedPreferences.getString(typeKey) != null) {
      return await sharedPreferences.getString(typeKey)!;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> savetype({required String type}) async {
    return await sharedPreferences.setString(typeKey, type);
  }
}
