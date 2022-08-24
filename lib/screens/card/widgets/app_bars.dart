import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';

AppBar AppBarWinpeCard(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      color: primaryColor,
    ),
    centerTitle: true,
    title: Text("Thẻ Winpe Pay", style: textHeaderScreen),
    iconTheme: IconThemeData(
      color: mobileBackgroundColor, //change your color here
    ),
  );
}
