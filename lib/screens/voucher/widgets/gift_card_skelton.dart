import 'package:flutter/material.dart';
import 'package:winpe_pay/widgets/skeleton.dart';

class GiftCardSkelton extends StatelessWidget {
  const GiftCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Skeleton(height: 140, width: 300),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(
                width: 280,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skeleton(
                      width: 120,
                    ),
                    Skeleton(
                      width: 150,
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
