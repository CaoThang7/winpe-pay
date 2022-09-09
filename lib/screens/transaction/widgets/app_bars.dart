import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';

AppBar AppBarTransactionHistory(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      color: primaryColor,
    ),
    centerTitle: true,
    title: Text("Lịch sử giao dịch", style: textNameCard),
    iconTheme: IconThemeData(
      color: mobileBackgroundColor, //change your color here
    ),
  );
}

AppBar AppBarTransactionDetail(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      color: primaryColor,
    ),
    centerTitle: true,
    title: Text("Chi tiết giao dịch", style: textNameCard),
    iconTheme: IconThemeData(
      color: mobileBackgroundColor, //change your color here
    ),
  );
}
