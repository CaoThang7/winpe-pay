import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselImage extends StatefulWidget {
  CarouselImage({Key? key}) : super(key: key);

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  int activeIndex = 0;

  void PageChanged(var index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: GlobalVariables.carouselImages.map(
            (i) {
              return Builder(
                builder: (BuildContext context) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    i,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
              viewportFraction: 1,
              height: 150,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) => PageChanged(index)),
        ),
        SizedBox(
          height: 10,
        ),
        buildIndicator(activeIndex)
      ],
    );
  }
}

Widget buildIndicator(int activeIndex) => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: GlobalVariables.carouselImages.length,
      effect: ExpandingDotsEffect(
          dotHeight: 10,
          dotWidth: 10,
          dotColor: Color.fromARGB(255, 228, 227, 227),
          activeDotColor: primaryColor),
);
