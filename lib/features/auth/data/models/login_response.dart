class LoginResponse {
  int? status;
  String? msg;
  LoginData? data;
  LoginResponse({
    required this.status,
    required this.msg,
    required this.data,
  });
  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];

    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }
}

class LoginData {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? photo;
  String? token;
  String? type;
  String? address;

  LoginData({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.photo,
    required this.token,
    required this.type,
    required this.address,
  });

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    address = json['address'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    photo = json['photo'];
    token = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['address'] = address;
    data['email'] = email;
    data['username'] = username;
    data['phone'] = phone;
    data['photo'] = photo;
    data['api_token'] = token;

    return data;
  }
}

class RegisterResponse {
  int? status;
  String? msg;
  LoginData? data;
  RegisterResponse({
    required this.status,
    required this.msg,
    required this.data,
  });
  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];

    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }
}

class RegisterData {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? photo;
  String? token;
  String? type;
  String? address;

  RegisterData({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.photo,
    required this.token,
    required this.type,
    required this.address,
  });

  RegisterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    address = json['address'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    photo = json['photo'];
    token = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['address'] = address;
    data['email'] = email;
    data['username'] = username;
    data['phone'] = phone;
    data['photo'] = photo;
    data['api_token'] = token;

    return data;
  }
}
