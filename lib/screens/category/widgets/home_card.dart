import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';

class HomeCard extends StatefulWidget {
  final data;
  const HomeCard({Key? key, required this.data}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.data['color'],
      child: Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage(widget.data['image']),
              fit: BoxFit.contain,
              opacity: 0.4,
              alignment: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: primaryColor,
                child: Image.asset(
                  widget.data['icon'],
                  height: 25,
                  width: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.data['title'], style: textStandardBold),
              Text(widget.data['decription'], style: textStandard),
            ],
          )),
    );
  }
}
