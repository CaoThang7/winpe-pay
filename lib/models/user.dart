import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? phone;
  final String? uid;
  final DateTime? dateCreated;
  final DateTime? dateSignedIn;
  final String photoUrl;
  final String? accNo;
  final String? ifscCode;
  final String? username;
  final String? money;
  final String? diamond;
  const User({
    required this.phone,
    required this.uid,
    required this.dateCreated,
    required this.dateSignedIn,
    required this.photoUrl,
    required this.accNo,
    required this.ifscCode,
    required this.username,
    required this.money,
    required this.diamond,
  });

  static User fromJson(Map<String, dynamic> json) => User(
      phone: json["phone"],
      uid: json["uid"],
      dateCreated: json['dateCreated'].toDate(),
      dateSignedIn: json['dateSignedIn'].toDate(),
      photoUrl: json["photoUrl"],
      accNo: json["accNo"],
      ifscCode: json["ifscCode"],
      username: json["username"],
      money: json["money"],
      diamond: json["diamond"]);

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "uid": uid,
        "dateCreated": dateCreated,
        "dateSignedIn": dateSignedIn,
        "photoUrl": photoUrl,
        "accNo": accNo,
        "ifscCode": ifscCode,
        "username": username,
        "money": money,
        "diamond": diamond,
      };
}
