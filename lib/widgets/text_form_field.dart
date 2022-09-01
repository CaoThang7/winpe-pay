import 'package:flutter/material.dart';
import 'package:winpe_pay/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final onchange;
  final bool enabledTextForm;
  final valid_input;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.onchange,
    this.enabledTextForm = true,
    this.valid_input,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabledTextForm,
      controller: controller,
      validator: valid_input,
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineInputBorderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineInputBorderColor),
        ),
      ),
      maxLines: maxLines,
    );
  }
}
