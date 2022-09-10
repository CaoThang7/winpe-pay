import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:winpe_pay/utils/global_variable.dart';

class NotificationCard extends StatefulWidget {
  final data;
  const NotificationCard({Key? key, required this.data}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    DateTime date =
        DateTime.parse(widget.data['dateCreated'].toDate().toString());
    String dateCreated = DateFormat('MM/dd/yyyy hh:mm').format(date);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: secondaryColor, width: 0.3)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 0, child: GlobalVariables.logoAppSmall),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.data['money'].toString().toVND()}',
                        style: textTitlePayment),
                    Text(
                      '${widget.data['content']}',
                      style: textStandard,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Text('${dateCreated}'),
            ),
          ],
        ));
  }
}
