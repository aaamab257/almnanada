class NotificationsModel {
  int? status;
  String? msg;
  NotificationsData? notificationsData;
  NotificationsModel({
    required this.msg,
    required this.status,
    required this.notificationsData,
  });
}

class NotificationsData {
  List<NotificationItem>? notificationsItem;
  NotificationsData({
    required this.notificationsItem,
  });
  NotificationsData.fromJson(Map<String, dynamic> json) {
    if (json['PushNotification'] != null) {
      notificationsItem = <NotificationItem>[];
      json['PushNotification'].forEach((v) {
        notificationsItem!.add(NotificationItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notificationsItem != null) {
      data['PushNotification'] =
          notificationsItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationItem {
  int? id;

  String? title;
  String? message;
  CallstudentModel? callstudent;
  String? created_at;
  String? photo;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.callstudent,
    required this.created_at,
    required this.photo,
  });

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    callstudent = json['callstudent'] != null
        ? CallstudentModel.fromJson(json['callstudent'])
        : null;
    created_at = json['created_at'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = title;
    data['message'] = message;
    if (callstudent != null) {
      data['callstudent'] = callstudent!.toJson();
    }
    data['created_at'] = created_at;
    data['photo'] = photo;
    return data;
  }
}

class CallstudentModel {
  int? id;
  String? parent_pickup_time;

  CallstudentModel({
    required this.id,
    required this.parent_pickup_time,
  });
  CallstudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parent_pickup_time = json['parent_pickup_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_pickup_time'] = parent_pickup_time;
    return data;
  }
}
