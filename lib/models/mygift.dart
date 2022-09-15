import 'dart:convert';

MyGift myGiftFromJson(String str) => MyGift.fromJson(json.decode(str));

String myGiftToJson(MyGift data) => json.encode(data.toJson());

class MyGift {
  MyGift({
    required this.userId,
    required this.giftId,
    required this.status,
    required this.gift,
  });

  String? userId;
  String? giftId;
  bool status;
  Object? gift;

  factory MyGift.fromJson(Map<String, dynamic> json) => MyGift(
        userId: json["userId"],
        giftId: json["giftId"],
        status: json["status"],
        gift: json["gift"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "giftId": giftId,
        "status": status,
        "gift": gift,
      };
}
