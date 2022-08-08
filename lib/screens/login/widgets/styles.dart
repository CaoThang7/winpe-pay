import 'package:flutter/material.dart';
import 'package:winpe_pay/utils/colors.dart';

TextStyle get textNameApp {
  return (
    TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: 'Arsenal-Bold',
      fontStyle: FontStyle.italic,
      color: Colors.white
    )
  );
}

TextStyle get textLogin {
  return (
    TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: primaryColor
    )
  );
}

TextStyle get textWelcomeBack {
  return (
    TextStyle(
      fontSize: 18,
      fontFamily: 'Roboto',
      color: secondaryColor
    )
  );
}
