class Student {
  int? status;
  String? msg;
  StudentData? data;
  Student({
    required this.status,
    required this.msg,
    required this.data,
  });
}

class StudentData {
  List<StudentDetails>? list;
  StudentData({
    required this.list,
  });
  StudentData.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      list = <StudentDetails>[];
      json['students'].forEach((v) {
        list!.add(StudentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['students'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentDetails {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? photo;
  String? token;
  String? type;
  Room? room;
  Floor? floor;

  StudentDetails(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.phone,
      required this.photo,
      required this.token,
      required this.type,
      required this.floor,
      required this.room});

  StudentDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    email = json['email'];
    floor = json['floor'] != null ? Floor.fromJson(json['floor']) : null;
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
    username = json['username'] ?? "";
    phone = json['phone'];
    photo = json['photo'];
    token = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (floor != null) {
      data['floor'] = floor!.toJson();
    }
    if (room != null) {
      data['room'] = room!.toJson();
    }
    data['type'] = type;
    data['email'] = email;
    data['username'] = username;
    data['phone'] = phone;
    data['photo'] = photo;
    data['api_token'] = token;

    return data;
  }
}

class Floor {
  int? id;
  String? name_ar;
  String? name_en;
  String? photo;

  Floor({
    required this.id,
    required this.photo,
    required this.name_ar,
    required this.name_en,
  });

  Floor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name_ar = json['name'];

    photo = json['photo'];
    name_en = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name_en;
    data['name'] = name_ar;

    data['photo'] = photo;

    return data;
  }
}

class Room {
  int? id;
  String? name_ar;
  String? name_en;
  String? photo;

  Room({
    required this.id,
    required this.photo,
    required this.name_ar,
    required this.name_en,
  });

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name_ar = json['name'];

    photo = json['photo'];
    name_en = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name_en;
    data['name'] = name_ar;

    data['photo'] = photo;

    return data;
  }
}
