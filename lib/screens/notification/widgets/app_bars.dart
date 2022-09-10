import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';

AppBar AppBarNotification(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      color: primaryColor,
    ),
    centerTitle: true,
    title: Text("Thông báo", style: textNameCard),
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: mobileBackgroundColor,
        )),
  );
}
