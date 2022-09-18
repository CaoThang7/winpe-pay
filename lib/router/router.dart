import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/account/edit_profile.dart';
import 'package:winpe_pay/screens/account/profile_screen.dart';
import 'package:winpe_pay/screens/card/winpe_card_screen.dart';
import 'package:winpe_pay/screens/gift/gift_success.dart';
import 'package:winpe_pay/screens/gift/user_gift_screen.dart';
import 'package:winpe_pay/screens/login/login_screen.dart';
import 'package:winpe_pay/screens/login/otp_screen.dart';
import 'package:winpe_pay/screens/notification/notification_screen.dart';
import 'package:winpe_pay/screens/payment/payment_screen.dart';
import 'package:winpe_pay/screens/payment/payment_success.dart';
import 'package:winpe_pay/screens/search/search_screen.dart';
import 'package:winpe_pay/screens/splash/splash_screen.dart';
import 'package:winpe_pay/screens/support/support_screen.dart';
import 'package:winpe_pay/screens/transaction/transaction_detail.dart';
import 'package:winpe_pay/screens/transaction/transaction_screen.dart';
import 'package:winpe_pay/screens/voucher/voucher_detail.dart';
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
    case TransactionDetail.routeName:
      var dataTransaction = routeSettings.arguments;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TransactionDetail(
          dataTransaction: dataTransaction,
        ),
      );
    case NotificationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotificationScreen(),
      );
    case VoucherDetail.routeName:
      var dataGift = routeSettings.arguments;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => VoucherDetail(
          dataGift: dataGift,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case UserGiftScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UserGiftScreen(),
      );
    case GiftSuccess.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GiftSuccess(),
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
