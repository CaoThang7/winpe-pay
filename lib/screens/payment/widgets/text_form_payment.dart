import 'package:flutter/material.dart';
import 'package:winpe_pay/widgets/text_form_field.dart';

class TextFormPayment extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController stkController;
  final TextEditingController moneyController;
  final TextEditingController contentController;
  final bool vis;
  final onchange;
  final String username;
  final valid_accNo;
  final valid_money;
  final valid_content;
  const TextFormPayment(
      {Key? key,
      required this.usernameController,
      required this.stkController,
      required this.moneyController,
      required this.contentController,
      this.onchange,
      required this.vis,
      required this.username,
      this.valid_accNo,
      this.valid_money,
      this.valid_content})
      : super(key: key);

  @override
  State<TextFormPayment> createState() => _TextFormPaymentState();
}

class _TextFormPaymentState extends State<TextFormPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Column(
        children: [
          Visibility(
            visible: widget.vis,
            child: Expanded(
              flex: 1,
              child: CustomTextFormField(
                enabledTextForm: false,
                controller: widget.usernameController,
                hintText: '${widget.username}',
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomTextFormField(
              onchange: widget.onchange,
              controller: widget.stkController,
              hintText: 'Số tài khoản',
              valid_input: widget.valid_accNo,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomTextFormField(
              controller: widget.moneyController,
              hintText: 'Số tiền (đ)',
              valid_input: widget.valid_money,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomTextFormField(
              controller: widget.contentController,
              hintText: 'Nội dung (không dấu và in hoa)',
              valid_input: widget.valid_content,
            ),
          ),
        ],
      ),
    );
  }
}
