import 'package:flutter/material.dart';
import 'package:winpe_pay/utils/colors.dart';

// for displaying snackbars
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: primaryColor,
      behavior: SnackBarBehavior.floating,
      content: Text(text),
    ),
  );
}
