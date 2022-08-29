import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/category/widgets/menu_home_card.dart';
import 'package:winpe_pay/utils/global_variable.dart';

class CategoryHome extends StatefulWidget {
  const CategoryHome({Key? key}) : super(key: key);

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: GlobalVariables.menuNewsHome.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 220),
          itemBuilder: (context, index) {
            final data = GlobalVariables.menuNewsHome[index];
            return NewsCard(data: data);
          }),
    );
  }
}
