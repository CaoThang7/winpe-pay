import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winpe_pay/providers/user_provider.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';

class CardWinpe extends StatefulWidget {
  const CardWinpe({Key? key}) : super(key: key);

  @override
  State<CardWinpe> createState() => _CardWinpeState();
}

class _CardWinpeState extends State<CardWinpe> {
  @override
  Widget build(BuildContext context) {
    final uid = context.watch<UserProvider>().user;
    print(uid?.accNo?.substring(9));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          // Card Winpe Payy
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 199,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/technology.jpg'),
                      fit: BoxFit.fill,
                      opacity: 0.3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/arctic-fox.jpg",
                            height: 35,
                            width: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "WP",
                            style: textNameApp,
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/images/mastercard.png",
                        height: 35,
                        width: 35,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "*** *** *** ${uid?.accNo?.substring(9)}",
                    style: textHeaderScreen,
                  ),
                  Text(
                    "${uid?.username}",
                    style: textNameCard,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "VALID FROM \u{003E} --/-- ",
                            style: textValidFrom,
                          ),
                          Text(
                            "----- ---- -----",
                            style: textValidFrom,
                          ),
                        ],
                      ),
                      Text(
                        "napas",
                        style: textNameNapas,
                      ),
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 15,
          ),
          // desciption (reason to use WinpeCard)
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3 lý do nên sử dụng thẻ Winpe Pay",
                    style: textStandardBold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    itemCount: GlobalVariables.reasonuseWinpeCard.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = GlobalVariables.reasonuseWinpeCard[index];
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            Image.asset(
                              data['image'] ?? "",
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(data['title'] ?? "")
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Cách đăng ký phát hành thẻ WinpePay",
                    style: textStandardBold,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                      "Quý khách vui lòng mang CMND/Hộ chiếu ra quầy giao dịch gần nhất để được hỗ trợ đăng kí phát hành thẻ WinpePay",
                      style: textStandard),
                ],
              ))
        ],
      ),
    );
  }
}
