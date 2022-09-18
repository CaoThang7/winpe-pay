import 'package:flutter/material.dart';
import 'package:winpe_pay/widgets/skeleton.dart';

class SearchCardSkelton extends StatelessWidget {
  const SearchCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Skeleton(
                height: 170,
                width: 360,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(
                width: 360,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skeleton(
                      width: 150,
                    ),
                    Skeleton(
                      width: 165,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
