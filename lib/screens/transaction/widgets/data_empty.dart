import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';

class DataEmpty extends StatefulWidget {
  const DataEmpty({Key? key}) : super(key: key);

  @override
  State<DataEmpty> createState() => _DataEmptyState();
}

class _DataEmptyState extends State<DataEmpty> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/no-data.png",
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Center(
              child: Text(
            "Chưa có giao dịch nào...",
            style: textWelcomeBack,
          )),
        )
      ],
    );
  }
}
