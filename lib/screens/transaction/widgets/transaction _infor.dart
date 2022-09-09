import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:intl/intl.dart';

class TransactionInfor extends StatefulWidget {
  final dataTransaction;
  const TransactionInfor({Key? key, required this.dataTransaction})
      : super(key: key);

  @override
  State<TransactionInfor> createState() => _TransactionInforState();
}

class _TransactionInforState extends State<TransactionInfor> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(widget.dataTransaction['dateCreated'].toDate().toString());
    String dateCreated = DateFormat('MM/dd/yyyy hh:mm').format(date);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.3, color: secondaryColor),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thông tin giao dịch",
              style: textStandardBold,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tên người hưởng thụ",
                  style: textPaymentDetail,
                ),
                Text(
                  "${widget.dataTransaction['username']}",
                  style: textStandardBlack,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nội dung giao dịch",
                  style: textPaymentDetail,
                ),
                Text(
                  "${widget.dataTransaction['content']}",
                  style: textStandardBlack,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mã giao dịch",
                  style: textPaymentDetail,
                ),
                Text(
                  "${widget.dataTransaction['code'].toString()}",
                  style: textStandardBlack,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Thời gian giao dịch",
                  style: textPaymentDetail,
                ),
                Text(
                  "${dateCreated}",
                  style: textStandardBlack,
                )
              ],
            ),
          ],
        ));
  }
}
