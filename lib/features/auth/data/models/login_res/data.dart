class Data {
  String? name;
  String? email;
  String? phone;
  String? type;
  int? status;
  int? groupId;
  int? adminId;
  DateTime? updatedAt;
  String? createdAt;
  int? id;
  String? apiToken;
  dynamic deviceToken;

  Data({
    this.name,
    this.email,
    this.phone,
    this.type,
    this.status,
    this.groupId,
    this.adminId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.apiToken,
    this.deviceToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        type: json['type'] as String?,
        status: json['status'] as int?,
        groupId: json['group_id'] as int?,
        adminId: json['admin_id'] as int?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] as String?,
        id: json['id'] as int?,
        apiToken: json['api_token'] as String?,
        deviceToken: json['device_token'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'type': type,
        'status': status,
        'group_id': groupId,
        'admin_id': adminId,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt,
        'id': id,
        'api_token': apiToken,
        'device_token': deviceToken,
      };
}
