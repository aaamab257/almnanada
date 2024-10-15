class CallstudentModelH {
  int? status;
  String? msg;
  CallStudentData? data;
  CallstudentModelH({
    required this.status,
    required this.msg,
    required this.data,
  });
}

class CallStudentData {
  int? id;

  String? callTime;
  String? outTime;
  String? waitingTime;
  String? pickupTime;
  String? is_student_out_for_parent;

  CallStudentData({
    required this.id,
    required this.callTime,
    required this.outTime,
    required this.waitingTime,
    required this.pickupTime,
    required this.is_student_out_for_parent,
  });
// "parent_call_time": "17:01:40",
//                 "student_out_for_parent_time": "17:05:04",
//                 "parent_pickup_time": "19:17:26",
//                 "parent_waiting_time": "02:15:00",
//is_student_out_for_parent
  CallStudentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    callTime = json['parent_call_time'];
    outTime = json['student_out_for_parent_time'];
    pickupTime = json['parent_pickup_time'];
    waitingTime = json['parent_waiting_time'];
    is_student_out_for_parent = json['is_student_out_for_parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['parent_call_time'] = callTime;
    data['student_out_for_parent_time'] = outTime;
    data['parent_pickup_time'] = pickupTime;
    data['parent_waiting_time'] = waitingTime;
    data['is_student_out_for_parent'] = waitingTime;
    return data;
  }
}

class CallStudentDetails {}

class Observer {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? photo;
  String? token;
  String? type;

  Observer({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.photo,
    required this.token,
    required this.type,
  });

  Observer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
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

  String? photo;

  Floor({
    required this.id,
    required this.photo,
    required this.name_ar,
  });

  Floor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name_ar = json['name'];

    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    data['name'] = name_ar;

    data['photo'] = photo;

    return data;
  }
}

class Room {
  int? id;
  String? name_ar;

  String? photo;

  Room({
    required this.id,
    required this.photo,
    required this.name_ar,
  });

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name_ar = json['name'];

    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    data['name'] = name_ar;

    data['photo'] = photo;

    return data;
  }
}
