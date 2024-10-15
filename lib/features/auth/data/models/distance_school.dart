class DBFASTOSN {
  int? status;
  String? msg;
  DistanceSchool? data;
  DBFASTOSN({
    required this.status,
    required this.msg,
    required this.data,
  });
}

class DistanceSchool {
  int? id;
  String? name;
  String? lat;
  String? long;
  String? dBFASTOSN;

  DistanceSchool({
    required this.id,
    required this.name,
    required this.lat,
    required this.long,
    required this.dBFASTOSN,
  });

  DistanceSchool.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    lat = json['lat'];
    long = json['long'];
    dBFASTOSN = json['DBFASTOSN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    data['lat'] = lat;
    data['long'] = long;
    data['DBFASTOSN'] = dBFASTOSN;

    return data;
  }
}
