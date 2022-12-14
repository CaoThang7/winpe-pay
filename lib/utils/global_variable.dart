import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/account/account_screen.dart';
import 'package:winpe_pay/screens/home/home_screen.dart';
import 'package:winpe_pay/screens/voucher/voucher_screen.dart';
import 'dart:math';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [Color(0xffcc2b5e), Color(0xff753a88)],
    stops: [0.5, 1.0],
  );

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

  static var imageSuccess = Image.network(
    "https://t4.ftcdn.net/jpg/02/22/29/41/240_F_222294164_NUH8FmMaeHKJ2ZY0HfqTwSfbJgxqnZI1.jpg",
    height: 150,
    width: 150,
  );

  static var imageError = Image.asset(
    "assets/images/error.png",
    height: 100,
    width: 100,
  );

  String avatarProfile = "https://i.stack.imgur.com/l60Hf.png";

  String loadingLottie = "https://assets6.lottiefiles.com/packages/lf20_lb3jx6jr.json";

  String paymentSuccess = "https://assets5.lottiefiles.com/private_files/lf30_qr37agb3.json";

  String imageEmpty = 'https://archive.org/download/no-photo-available/no-photo-available.png';

  static const List<String> carouselImages = [
    'https://designercomvn.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2017/08/26020137/nhan-thiet-ke-banner-trung-thu-gia-re-thu-hut-khach-hang8.jpg',
    'https://genk.mediacdn.vn/zoom/700_438/139269124445442048/2021/1/22/photo1611286986146-16112869863391829588950.png',
    'https://nhaccutiendat.vn/upload/images/content/giam%20gia%20he%202018.png',
    'https://cdn-www.vinid.net/2020/09/8c909934-banner-tin-t%C3%9F%E2%95%97%E2%8C%90c-v%E2%94%9C%C3%A1-app-push.jpg',
  ];

  static const List<Map<String, String>> userSettings = [
    {
      'id': '1',
      'title': 'T??i kho???n Winpe Pay',
      'image': 'assets/images/user.png',
    },
    {
      'id': '2',
      'title': 'Th??? Winpe Pay',
      'image': 'assets/images/arctic-fox.jpg',
    },
    {
      'id': '3',
      'title': 'L???ch s??? giao d???ch',
      'image': 'assets/images/clock.png',
    },
    {
      'id': '4',
      'title': 'Th??ng b??o',
      'image': 'assets/images/bell.png',
    },
    {
      'id': '5',
      'title': '??u ????i c???a t??i',
      'image': 'assets/images/hot-sale.png',
    },
    {
      'id': '6',
      'title': '????ng xu???t',
      'image': 'assets/images/logout.png',
    },
  ];

  static const List<Map<String, String>> reasonuseWinpeCard = [
    {
      'id': '1',
      'title': 'Mi???n ph?? r??t ti???n ATM',
      'image': 'assets/images/arctic-fox.jpg',
    },
    {
      'id': '2',
      'title': 'Mi???n ph?? thanh to??n t???i qu???y qua POS',
      'image': 'assets/images/arctic-fox.jpg',
    },
    {
      'id': '3',
      'title': 'Mi???n ph?? ph??t h??nh',
      'image': 'assets/images/arctic-fox.jpg',
    },
  ];

  static const List<Map<String, dynamic>> menuBelowBannerHome = [
    {
      'id': '1',
      'icon': 'assets/images/refresh.png',
      'title': 'Chuy???n ti???n',
      'decription': 'Mi???n ph??',
      'image': 'assets/images/piggy-bank.png',
      'color': Color.fromARGB(255, 177, 225, 254)
    },
    {
      'id': '2',
      'icon': 'assets/images/headphone.png',
      'title': 'Y??u c???u',
      'decription': 'Trung t??m h??? tr???',
      'image': 'assets/images/customer-service-agent.png',
      'color': Color(0xffFFF0F5)
    },
  ];

  static const List<Map<String, dynamic>> menuNewsHome = [
    {
      'id': '1',
      'title': '?????i h???i ho??n ti???n - Khuy???n m??i c???c s???c',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new1.jpg',
    },
    {
      'id': '2',
      'title': 'Thanh to??n c?????c tr??? sau',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new2.jpg',
    },
    {
      'id': '3',
      'title': 'Mua s???m th??? ga - an to??n ti???n l???i',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new3.jpg',
    },
    {
      'id': '4',
      'title': '?????c m?? c???a em - Th???c hi???n m?? ?????c thi???u nhi',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new4.jpg',
    },
    {
      'id': '5',
      'title': 'S??n deal kh???ng - Gi???m gi?? l??n t???i 70%',
      'decription': '',
      'time': '',
      'content': '',
      'image': 'assets/images/new5.jpg',
    },
    {
      'id': '6',
      'title': 'Tr??ng tr??n g??i tr???n y??u th????ng',
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

  String? verifiCode() {
    final length = 6;
    final numbers = '0123456789';

    String chars = '';
    chars += '$numbers';

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);

      return chars[indexRandom];
    }).join('');
  }
}
