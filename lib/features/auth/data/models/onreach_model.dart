class OnreachModel {
  int? status;
  String? msg;
  DataOnReach? data;
  OnreachModel({
    required this.status,
    required this.msg,
    required this.data,
  });
}

class DataOnReach {
  int? id;
  DataOnReach({this.id});
  DataOnReach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    return data;
  }
}
