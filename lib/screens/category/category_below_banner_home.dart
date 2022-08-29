import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/category/widgets/home_card.dart';
import 'package:winpe_pay/utils/global_variable.dart';

class CategoryBelowBannerHome extends StatefulWidget {
  const CategoryBelowBannerHome({Key? key}) : super(key: key);

  @override
  State<CategoryBelowBannerHome> createState() => _CategoryBelowBannerHomeState();
}

class _CategoryBelowBannerHomeState extends State<CategoryBelowBannerHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: GlobalVariables.menuBelowBannerHome.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 120),
          itemBuilder: (context, index) {
            final data = GlobalVariables.menuBelowBannerHome[index];
            return HomeCard(data: data);
          }),
    );
  }
}
