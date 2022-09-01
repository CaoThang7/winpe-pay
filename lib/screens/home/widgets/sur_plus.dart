import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpe_pay/providers/user_provider.dart';
import 'package:winpe_pay/resources/auth_methods.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class SurPlus extends StatefulWidget {
  const SurPlus({Key? key}) : super(key: key);

  @override
  State<SurPlus> createState() => _SurPlusState();
}

class _SurPlusState extends State<SurPlus> {
  AuthMethods authMethods = AuthMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authMethods.getUserDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    final uid = context.watch<UserProvider>().user;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            gradient: LinearGradient(
                colors: [
                  const Color(0xFFf5f7fa),
                  const Color(0xFFc4e0e5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // stops: [0.0,0.0],
                tileMode: TileMode.clamp),
            // color: mobileBackgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GlobalVariables.logoAppSmall,
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Winpe Pay",
                        style: textStandardBold,
                      ),
                    ],
                  ),
                  Text(
                      '${uid?.money.toString()}'.isNotEmpty
                          ? '${uid?.money.toString().toVND()}'
                          : '0 đ',
                      style: textStandard)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GlobalVariables.logodiamond,
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Kim cương",
                        style: textStandardBold,
                      ),
                    ],
                  ),
                  Text(
                      '${uid?.diamond.toString()}'.isNotEmpty
                          ? '${uid?.diamond.toString()}'
                          : '0',
                      style: textStandard)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
