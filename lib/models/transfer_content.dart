class TransferContent {
  final String? uid;
  final String? uidSender;
  final String? uidreceiver;
  final int? money;
  final String? content;
  final DateTime? time;
  const TransferContent(
      {required this.uid,
      required this.uidSender,
      required this.uidreceiver,
      required this.money,
      required this.content,
      required this.time});

  static TransferContent fromJson(Map<String, dynamic> json) => TransferContent(
        uid: json["uid"],
        uidSender: json["uidSender"],
        uidreceiver: json["uidreceiver"],
        money: json["money"],
        content: json["content"],
        time: json['time'].toDate(),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "uidSender": uidSender,
        "uidreceiver": uidreceiver,
        "money": money,
        "content": content,
        "time": time
      };
}
