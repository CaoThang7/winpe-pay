import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/account/edit_profile.dart';
import 'package:winpe_pay/screens/account/profile_screen.dart';
import 'package:winpe_pay/screens/card/winpe_card_screen.dart';
import 'package:winpe_pay/screens/login/login_screen.dart';
import 'package:winpe_pay/screens/login/otp_screen.dart';
import 'package:winpe_pay/screens/payment/payment_screen.dart';
import 'package:winpe_pay/screens/payment/payment_success.dart';
import 'package:winpe_pay/screens/splash/splash_screen.dart';
import 'package:winpe_pay/screens/support/support_screen.dart';
import 'package:winpe_pay/screens/transaction/transaction_screen.dart';
import 'package:winpe_pay/widgets/bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SplashScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case OtpScreen.routeName:
      String verifiId = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OtpScreen(
          verifiId: verifiId,
        ),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case ProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfileScreen(),
      );
    case EditProfile.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EditProfile(),
      );
    case WinpeCardScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WinpeCardScreen(),
      );
    case PaymentScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PaymentScreen(),
      );
    case SupportScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SupportScreen(),
      );
    case TransactionHistoryScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TransactionHistoryScreen(),
      );
    case PaymentSuccess.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PaymentSuccess(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('screen does not exist!'),
          ),
        ),
      );
  }
}
