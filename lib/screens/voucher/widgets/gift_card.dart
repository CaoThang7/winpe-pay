import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:intl/intl.dart';

class GiftCard extends StatefulWidget {
  final dataGift;
  const GiftCard({Key? key, required this.dataGift}) : super(key: key);

  @override
  State<GiftCard> createState() => _GiftCardState();
}

class _GiftCardState extends State<GiftCard> {
  String imageEmpty = 'https://archive.org/download/no-photo-available/no-photo-available.png';
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(widget.dataGift['expiryDate'].toDate().toString());
    String expiryDate = DateFormat('MM/dd/yyyy').format(date);
    return Container(
        decoration: BoxDecoration(
          color: mobileBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(8),
        width: 300,
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: widget.dataGift,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${widget.dataGift['image']}'.isNotEmpty
                                ? '${widget.dataGift['image']}'
                                : imageEmpty),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 95,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
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
                            "${widget.dataGift['diamond'].toString()}",
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
                  Text(
                    '${widget.dataGift['name']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStandardBold,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.card_giftcard_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.dataGift['diamond'].toString()} kim cương",
                            style: textStandardBlack,
                          )
                        ],
                      ),
                      Text(
                        "HSD: ${expiryDate}",
                        style: textExpiryDate,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
