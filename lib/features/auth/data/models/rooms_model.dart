class Rooms {
  int? status;
  String? msg;
  RoomsData? data;
  Rooms({
    required this.status,
    required this.msg,
    required this.data,
  });
}

class RoomsData {
  List<RoomDetails>? list;
  RoomsData({
    required this.list,
  });
  RoomsData.fromJson(Map<String, dynamic> json) {
    if (json['rooms'] != null) {
      list = <RoomDetails>[];
      json['rooms'].forEach((v) {
        list!.add(RoomDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['rooms'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoomDetails {
  int? id;
  String? name;

  String? photo;

  RoomDetails({
    required this.id,
    required this.name,
    required this.photo,
  });

  RoomDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    data['photo'] = photo;

    return data;
  }
}
