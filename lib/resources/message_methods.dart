import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:winpe_pay/main.dart';
import 'package:winpe_pay/utils/colors.dart';

class MessageMethods {
  final _notifications = FlutterLocalNotificationsPlugin();
  Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        importance: Importance.max,
        color: primaryColor,
        icon: "@mipmap/ic_launcher",
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);
}
