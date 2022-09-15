class Gift {
  final String? uid;
  final String? code;
  final String? name;
  final String? type;
  final String? description;
  final String? image;
  final int diamond;
  final bool status;
  final DateTime? expiryDate;
  final DateTime? dateCreated;
  const Gift({
    required this.uid,
    required this.code,
    required this.name,
    required this.type,
    required this.description,
    required this.image,
    required this.diamond,
    required this.status,
    required this.expiryDate,
    required this.dateCreated,
  });

  static Gift fromJson(Map<String, dynamic> json) => Gift(
        uid: json["uid"],
        code: json["code"],
        name: json["name"],
        type: json["type"],
        description: json["description"],
        image: json["image"],
        diamond: json["diamond"],
        status: json["status"],
        expiryDate: json["expiryDate"].toDate(),
        dateCreated: json['dateCreated'].toDate(),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "code": code,
        "name": name,
        "type": type,
        "description": description,
        "image": image,
        "diamond": diamond,
        "status": status,
        "expiryDate": expiryDate,
        "dateCreated": dateCreated,
      };
}
