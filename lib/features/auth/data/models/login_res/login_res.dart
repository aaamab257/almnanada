import 'data.dart';

class LoginRes {
  int? status;
  String? msg;
  Data? data;

  LoginRes({this.status, this.msg, this.data});

  factory LoginRes.fromJson(Map<String, dynamic> json) => LoginRes(
        status: json['status'] as int?,
        msg: json['msg'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'msg': msg,
        'data': data?.toJson(),
      };
}
