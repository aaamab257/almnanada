import 'package:json_annotation/json_annotation.dart';

part 'notification_body.g.dart';

@JsonSerializable()
class NotificationBody {
  int? orderId;
  String? type;

  NotificationBody({
    this.orderId,
    this.type,
  });

  factory NotificationBody.fromJson(Map<String, dynamic> json) =>
      _$NotificationBodyFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationBodyToJson(this);
}
