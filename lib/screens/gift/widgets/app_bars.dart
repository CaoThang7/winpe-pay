import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';

AppBar AppBarMyGift(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
    ),
    centerTitle: true,
    title: Text("Ưu đãi của tôi", style: textNameCard),
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
