import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';

AppBar AppBarPayment(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      color: primaryColor,
    ),
    centerTitle: true,
    title: Text("Chuyển đến số tài khoản", style: textNameCard),
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
