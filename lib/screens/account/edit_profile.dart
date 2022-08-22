import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:winpe_pay/widgets/loader.dart';
class EditProfile extends StatefulWidget {
  static const String routeName = '/edit-profile-screen';
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LoaderLottie()
    );
  }
}
