import 'package:flutter/material.dart';
import 'package:winpe_pay/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 18, color: Colors.white)),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        primary: primaryColor,
      ),
    );
  }
}
