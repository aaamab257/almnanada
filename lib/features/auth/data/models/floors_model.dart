class Floors {
  int? status;
  String? msg;
  FloorsData? data;
  Floors({
    required this.status,
    required this.msg,
    required this.data,
  });
}

class FloorsData {
  List<FloorDetails>? list;
  FloorsData({
    required this.list,
  });
  FloorsData.fromJson(Map<String, dynamic> json) {
    if (json['floors'] != null) {
      list = <FloorDetails>[];
      json['floors'].forEach((v) {
        list!.add(FloorDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['floors'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FloorDetails {
  int? id;
  String? name;

  String? photo;

  FloorDetails({
    required this.id,
    required this.name,
    required this.photo,
  });

  FloorDetails.fromJson(Map<String, dynamic> json) {
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
