import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/category/category_below_banner_home.dart';
import 'package:winpe_pay/screens/category/category_home.dart';
import 'package:winpe_pay/screens/home/widgets/carousel_image.dart';
import 'package:winpe_pay/screens/home/widgets/sur_plus.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:winpe_pay/widgets/loader.dart';

SliverList SliverListCustom(
    BuildContext context, bool visible, bool isLoading) {
  return SliverList(
    delegate: SliverChildListDelegate([
      SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: visible,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 115,
                  width: MediaQuery.of(context).size.width,
                  color: primaryColor,
                  child: SurPlus()),
            ),
            isLoading
                ? LoaderLottie()
                : Container(
                    height: 1150,
                    width: MediaQuery.of(context).size.width,
                    color: mobileBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        CarouselImage(),
                        CategoryBelowBannerHome(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Khám phá cùng Winpe Pay",
                                  style: textStandardBold),
                              Text(
                                "Xem tất cả \u{27A2}",
                                style: textStandard,
                              ),
                            ],
                          ),
                        ),
                        CategoryHome(),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    ]),
  );
}
