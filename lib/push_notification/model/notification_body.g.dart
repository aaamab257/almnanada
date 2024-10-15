// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationBody _$NotificationBodyFromJson(Map<String, dynamic> json) =>
    NotificationBody(
      orderId: (json['orderId'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NotificationBodyToJson(NotificationBody instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'type': instance.type,
    };
