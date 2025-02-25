import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:domain/features/notifications/entity/notification_entity.dart';
import 'package:xml/xml.dart';

class NotificationsModel implements DecodeAble<NotificationsModel, String> {
  List<NotificationModel>? notifications = [];

  NotificationsModel({
    this.notifications,
  });

  @override
  NotificationsModel fromJson(String json) {
    final document = XmlDocument.parse(json);
    var textContent = document.root.innerText;
    List<dynamic> jsonData = jsonDecode(textContent);
    notifications = jsonData.map((e) => NotificationModel.fromJson(e)).toList();
    return NotificationsModel(
      notifications: notifications,
    );
  }
}

class NotificationModel
    implements DecodeAble<NotificationModel, Map<String, dynamic>> {
  String? time;
  String? content;

  NotificationModel({
    this.content,
    this.time,
  });

  @override
  NotificationModel fromJson(Map<String, dynamic> json) {
    return NotificationModel.fromJson(json);
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      time: "time",
      content: "lBNotificationText",
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      content: content ?? "",
      time: time ?? "",
    );
  }
}
