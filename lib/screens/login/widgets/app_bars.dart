import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';

AppBar AppBarLogin(BuildContext context) {
  return AppBar(
      flexibleSpace: Container(
        color: primaryColor,
      ),
      centerTitle: true,
      title: Text(
        "Winpe Pay",
        style: textNameApp
      ));
}
