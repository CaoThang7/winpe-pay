import 'dart:convert';

MyGift myGiftFromJson(String str) => MyGift.fromJson(json.decode(str));

String myGiftToJson(MyGift data) => json.encode(data.toJson());

class MyGift {
  MyGift({
    required this.uid,
    required this.userId,
    required this.giftId,
    required this.status,
    required this.gift,
  });

  String? uid;
  String? userId;
  String? giftId;
  bool status;
  Object? gift;

  factory MyGift.fromJson(Map<String, dynamic> json) => MyGift(
        uid: json["uid"],
        userId: json["userId"],
        giftId: json["giftId"],
        status: json["status"],
        gift: json["gift"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "userId": userId,
        "giftId": giftId,
        "status": status,
        "gift": gift,
      };
}
