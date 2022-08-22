import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';

class SettingCard extends StatefulWidget {
  final dataSettings;
  final int index;
  const SettingCard({Key? key, required this.dataSettings, required this.index})
      : super(key: key);

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          color: mobileBackgroundColor,
          border: Border(
              bottom: BorderSide(
            color: secondaryColor,
            width: 0.3,
          ))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.dataSettings['image'].toString(),
                  fit: BoxFit.contain,
                  height: 28,
                  width: 28,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    '${widget.dataSettings['title']}',
                    style: textStandard,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
