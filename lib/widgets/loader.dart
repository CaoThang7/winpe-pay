import 'package:flutter/material.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:winpe_pay/utils/global_variable.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }
}

class LoaderLottie extends StatelessWidget {
  const LoaderLottie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(GlobalVariables().loadingLottie));
  }
}
