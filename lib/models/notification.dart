import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  final String? uid;
  final String? uidSender;
  final String? uidreceiver;
  final DateTime? dateCreated;
  final List notificaItems;
  const Notification(
      {required this.uid,
      required this.uidSender,
      required this.uidreceiver,
      required this.dateCreated,
      required this.notificaItems});

  static Notification fromJson(Map<String, dynamic> json) => Notification(
        uid: json["uid"],
        uidSender: json['uidSender'],
        uidreceiver: json['uidreceiver'],
        dateCreated: json['dateCreated'].toDate(),
        notificaItems: json["notificaItems"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "uidSender": uidSender,
        "uidreceiver": uidreceiver,
        "dateCreated": dateCreated,
        "notificaItems": notificaItems
      };
}
