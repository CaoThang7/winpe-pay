import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';

AppBar AppBarAccount(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      color: primaryColor,
    ),
    centerTitle: true,
    title: Text("Hồ Sơ", style: textHeaderScreen),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {},
          child: Icon(Icons.notifications_active, color: mobileBackgroundColor),
        ),
      )
    ],
    automaticallyImplyLeading: false,
  );
}

AppBar AppBarProfile(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      color: primaryColor,
    ),
    centerTitle: true,
    title: Text("Thông tin cá nhân", style: textHeaderScreen),
    iconTheme: IconThemeData(
      color: mobileBackgroundColor, //change your color here
    ),
  );
}
