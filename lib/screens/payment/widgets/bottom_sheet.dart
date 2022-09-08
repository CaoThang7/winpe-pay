import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:winpe_pay/resources/message_methods.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:winpe_pay/widgets/custom_button.dart';

class CustomBottomSheet extends StatefulWidget {
  final String uidSender;
  final String uidreceiver;
  final String money;
  final String content;
  final String account_money;
  final int moneyReceiver;
  const CustomBottomSheet(
      {Key? key,
      required this.uidSender,
      required this.uidreceiver,
      required this.money,
      required this.content,
      required this.account_money,
      required this.moneyReceiver})
      : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String? code = GlobalVariables().verifiCode();
  final MessageMethods messageMethods = MessageMethods();
  FireStoreMethods fireStoreMethods = FireStoreMethods();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VerificationCode(
            autofocus: false,
            textStyle: textStandard,
            keyboardType: TextInputType.number,
            underlineColor: Colors.amber,
            length: 6,
            cursorColor: primaryColor,
            clearAll: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Xoá tất cả',
                style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    color: Colors.blue[700]),
              ),
            ),
            onCompleted: (String value) {
              if (value == code) {
                fireStoreMethods.transfer(
                    context: context,
                    uidSender: widget.uidSender,
                    uidreceiver: widget.uidreceiver,
                    money: widget.money,
                    content: widget.content,
                    account_money: widget.account_money,
                    moneyReceiver: widget.moneyReceiver);
              }
              if (value != code) {
                messageMethods.showNotification(
                  title: 'Thất bại',
                  body: 'Mã xác thực không chính xác',
                  payload: "Thất bại",
                );
              }
            },
            onEditing: (bool value) {},
          ),
          Text(
            'Your code: $code',
            style: textStandard,
          ),
          SizedBox(
            height: 10,
          ),
          CustomButtonCancel(
            text: 'Hoàn tác',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
