import 'package:flutter/material.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:intl/intl.dart';

class MyGiftCard extends StatefulWidget {
  final dataGift;
  const MyGiftCard({
    Key? key,
    required this.dataGift,
  }) : super(key: key);

  @override
  State<MyGiftCard> createState() => _MyGiftCardState();
}

class _MyGiftCardState extends State<MyGiftCard> {
  FireStoreMethods fireStoreMethods = FireStoreMethods();
  
  updateStatusMyGift() {
    fireStoreMethods.updateStatusMyGift(
      context: context,
      uidMyGift: widget.dataGift['uid'],
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(
        widget.dataGift['gift']['expiryDate'].toDate().toString());
    String expiryDate = DateFormat('MM/dd/yyyy').format(date);
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: mobileBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${widget.dataGift['gift']['image']}'.isNotEmpty
                                ? '${widget.dataGift['gift']['image']}'
                                : GlobalVariables().imageEmpty),
                        fit: BoxFit.fill,
                        opacity: widget.dataGift['status'] == true ? 1 : 0.2),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 95,
                    decoration: BoxDecoration(
                        color: widget.dataGift['status'] == true
                            ? Colors.green[700]
                            : Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(15),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/diamond.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "${widget.dataGift['gift']['diamond'].toString()}",
                            style: textNameCard,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.dataGift['gift']['name']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: widget.dataGift['status'] == true
                          ? textStandardBold
                          : textStandardBoldGrey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: widget.dataGift['status'] == true
                                ? Colors.black
                                : Color.fromARGB(255, 206, 205, 205),
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("HSD: ${expiryDate}",
                              style: widget.dataGift['status'] == true
                                  ? textStandardBlack
                                  : textStandardGrey)
                        ],
                      ),
                      widget.dataGift['status'] == true
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: updateStatusMyGift,
                              child: Text(
                                "Sử dụng ngay",
                                style: textTitleHome,
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Text(
                                "Đã sử dụng",
                                style: textTitleHome,
                              ),
                            )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
