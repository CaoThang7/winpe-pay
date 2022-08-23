import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:winpe_pay/screens/account/widgets/app_bars.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/widgets/custom_button.dart';
import 'package:winpe_pay/widgets/loader.dart';
import 'package:winpe_pay/widgets/text_field_input.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/edit-profile-screen';
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _username = TextEditingController();
  final FireStoreMethods fireStoreMethods = FireStoreMethods();
  @override
  void dispose() {
    super.dispose();
    _username.dispose();
  }

  @override
  void initState() {
    super.initState();
    _username.addListener(() => setState(() {}));
  }

  void updateProfile() {
    fireStoreMethods.updateProfile(username: _username.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mobileBackgroundColor,
        appBar: AppBarEditProfile(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFieldInput(
                hintText: 'Nhập họ tên của bạn',
                textInputType: TextInputType.name,
                textEditingController: _username,
                suffixIcon: _username.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: Icon(
                          Icons.disabled_by_default_outlined,
                          color: primaryColor,
                        ),
                        onPressed: () => _username.clear(),
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                text: 'Cập nhật',
                onTap: () {
                  updateProfile();
                },
              ),
            ],
          ),
        ));
  }
}
