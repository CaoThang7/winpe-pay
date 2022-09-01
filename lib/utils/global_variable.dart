import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/account/account_screen.dart';
import 'package:winpe_pay/screens/home/home_screen.dart';
import 'package:winpe_pay/screens/voucher/voucher_screen.dart';
import 'dart:math';

class GlobalVariables {
  static var logoAppBig = Image.asset(
    'assets/images/arctic-fox.jpg',
    height: 150,
    width: 150,
  );

  static var imageCard = AssetImage('assets/images/technology.jpg');

  static var logoAppSmall = Image.asset(
    'assets/images/arctic-fox.jpg',
    height: 35,
    width: 35,
  );

  static var logoMasterCard = Image.asset(
    "assets/images/mastercard.png",
    height: 35,
    width: 35,
  );

  static var logodiamond = Image.asset(
    "assets/images/diamond.png",
    height: 35,
    width: 35,
  );

  String avatarProfile = "https://i.stack.imgur.com/l60Hf.png";

  String loadingLottie = "https://assets6.lottiefiles.com/packages/lf20_lb3jx6jr.json";

  static const List<String> carouselImages = [
    'https://designercomvn.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2017/08/26020137/nhan-thiet-ke-banner-trung-thu-gia-re-thu-hut-khach-hang8.jpg',
    'https://genk.mediacdn.vn/zoom/700_438/139269124445442048/2021/1/22/photo1611286986146-16112869863391829588950.png',
    'https://nhaccutiendat.vn/upload/images/content/giam%20gia%20he%202018.png',
    'https://cdn-www.vinid.net/2020/09/8c909934-banner-tin-t%C3%9F%E2%95%97%E2%8C%90c-v%E2%94%9C%C3%A1-app-push.jpg',
  ];

  static const List<Map<String, String>> userSettings = [
    {
      'id': '1',
      'title': 'Tài khoản Winpe Pay',
      'image': 'assets/images/user.png',
    },
    {
      'id': '2',
      'title': 'Thẻ Winpe Pay',
      'image': 'assets/images/arctic-fox.jpg',
    },
    {
      'id': '3',
      'title': 'Lịch sử giao dịch',
      'image': 'assets/images/clock.png',
    },
    {
      'id': '4',
      'title': 'Thông báo',
      'image': 'assets/images/bell.png',
    },
    {
      'id': '5',
      'title': 'Ưu đãi của tôi',
      'image': 'assets/images/hot-sale.png',
    },
    {
      'id': '6',
      'title': 'Đăng xuất',
      'image': 'assets/images/logout.png',
    },
  ];

  static const List<Map<String, String>> reasonuseWinpeCard = [
    {
      'id': '1',
      'title': 'Miễn phí rút tiền ATM',
      'image': 'assets/images/arctic-fox.jpg',
    },
    {
      'id': '2',
      'title': 'Miễn phí thanh toán tại quầy qua POS',
      'image': 'assets/images/arctic-fox.jpg',
    },
    {
      'id': '3',
      'title': 'Miễn phí phát hành',
      'image': 'assets/images/arctic-fox.jpg',
    },
  ];

  static const List<Map<String, dynamic>> menuBelowBannerHome = [
    {
      'id': '1',
      'icon': 'assets/images/refresh.png',
      'title': 'Chuyển tiền',
      'decription': 'Miễn phí',
      'image': 'assets/images/piggy-bank.png',
      'color': Color.fromARGB(255, 177, 225, 254)
    },
    {
      'id': '2',
      'icon': 'assets/images/headphone.png',
      'title': 'Yêu cầu',
      'decription': 'Trung tâm hỗ trợ',
      'image': 'assets/images/customer-service-agent.png',
      'color': Color(0xffFFF0F5)
    },
  ];

  static const List<Map<String, dynamic>> menuNewsHome = [
    {
      'id': '1',
      'title': 'Đại hội hoàn tiền - Khuyến mãi cực sốc',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new1.jpg',
    },
    {
      'id': '2',
      'title': 'Thanh toán cước trả sau',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new2.jpg',
    },
    {
      'id': '3',
      'title': 'Mua sắm thả ga - an toàn tiện lợi',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new3.jpg',
    },
    {
      'id': '4',
      'title': 'Ước mơ của em - Thực hiện mơ ước thiếu nhi',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new4.jpg',
    },
    {
      'id': '5',
      'title': 'Săn deal khủng - Giảm giá lên tới 70%',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new5.jpg',
    },
    {
      'id': '6',
      'title': 'Trăng tròn gói trọn yêu thương',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new6.jpg',
    },
  ];

  static List<Widget> homeScreenItems = [
    const HomeScreen(),
    const VoucherScreen(),
    const AccountScreen(),
  ];

  String? accountNo() {
    final length = 13;
    final numbers = '0123456789';

    String chars = '';
    chars += '$numbers';

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);

      return chars[indexRandom];
    }).join('');
  }

  String? ifscCode() {
    final length = 11;
    final lettersLowercase = 'abcdefghijklmnopqrstuvwxyz';
    final lettersUppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers = '0123456789';

    String chars = '';
    chars += '$lettersLowercase$lettersUppercase$numbers';

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);

      return chars[indexRandom];
    }).join('');
  }
}
