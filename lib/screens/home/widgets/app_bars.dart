import 'package:flutter/material.dart';
import 'package:winpe_pay/models/user.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';

SliverAppBar SliverAppBarCustom(User? uid, VoidCallback? press, bool visible) {
  return SliverAppBar(
    backgroundColor: primaryColor,
    expandedHeight: 75,
    stretch: true,
    flexibleSpace: FlexibleSpaceBar(
      stretchModes: [StretchMode.zoomBackground],
      background: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/images/technology2.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    ),
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('${uid?.photoUrl}'.isNotEmpty
                        ? '${uid?.photoUrl}'
                        : GlobalVariables().avatarProfile),
                    radius: 24,
                  )),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${uid?.username}'.isNotEmpty
                        ? '${uid?.username}'
                        : 'Tên tài khoản',
                    style: textFullNameHome,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: press,
                        child: Text(
                          'Xem số dư',
                          style: textTitleHome,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7, top: 3),
                        child: GestureDetector(
                          onTap: press,
                          child: Text(
                            visible ? '\u{2227}' : '\u{2228}',
                            style: textIconTitleHome,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Icon(Icons.notifications_active, color: mobileBackgroundColor)
        ],
      ),
    ),
  );
}
