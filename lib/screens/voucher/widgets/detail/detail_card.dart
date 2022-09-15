import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class DetailCard extends StatefulWidget {
  final dataGift;
  const DetailCard({Key? key, required this.dataGift}) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  String imageEmpty = 'https://archive.org/download/no-photo-available/no-photo-available.png';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime date = DateTime.parse(widget.dataGift['expiryDate'].toDate().toString());
    String expiryDate = DateFormat('MM/dd/yyyy').format(date);
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Hero(
            transitionOnUserGestures: true,
            tag: widget.dataGift,
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 5),
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: mobileBackgroundColor,
                    ),
                  ),
                ],
              ),
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${widget.dataGift['image']}'.isNotEmpty
                      ? '${widget.dataGift['image']}'
                      : imageEmpty),
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: mobileBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 70, 
                        vertical: 10
                      ),
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${widget.dataGift['name']}",
                            style: textNameDetailGift,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xffffdde1),
                                borderRadius: BorderRadius.all(Radius.circular(50))),
                            child: Text(
                              "Ngày hết hạn: ${expiryDate}",
                              style: textExpiryDatelGift,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20, 
                        vertical: 10
                      ),
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nội dung",
                            style: textStandardBoldBlack,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.dataGift['description']}",
                            style: textStandardBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20, 
                          vertical: 10
                        ),
                        width: size.width,
                        child: Column(
                          children: [
                            CustomButton(
                              text: 'Đổi ngay (${widget.dataGift['diamond'].toString()} kim cương)',
                              onTap: () {},
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
