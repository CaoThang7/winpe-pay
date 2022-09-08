import 'package:cloud_firestore/cloud_firestore.dart';

class TransferContent {
  final String? uid;
  final String? uidSender;
  final String? uidreceiver;
  final DateTime? time;
  final List transferItems;
  const TransferContent(
      {required this.uid,
      required this.uidSender,
      required this.uidreceiver,
      required this.time,
      required this.transferItems});

  static TransferContent fromJson(Map<String, dynamic> json) => TransferContent(
        uid: json["uid"],
        uidSender: json['uidSender'],
        uidreceiver: json['uidreceiver'],
        time: json['time'].toDate(),
        transferItems: json["transferItems"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "uidSender": uidSender,
        "uidreceiver": uidreceiver,
        "time": time,
        "transferItems": transferItems
      };
}
