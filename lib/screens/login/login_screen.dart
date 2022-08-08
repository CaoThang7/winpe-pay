import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/otp_screen.dart';
import 'package:winpe_pay/screens/login/widgets/app_bars.dart';
import 'package:winpe_pay/screens/login/widgets/below_app_bar.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/widgets/custom_button.dart';
import 'package:winpe_pay/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLogin(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              BelowAppBar(),
              SizedBox(
                height: 30,
              ),
              TextFieldInput(
                hintText: 'Nhập SĐT của bạn (+84)',
                textInputType: TextInputType.phone,
                textEditingController: _phoneController,
                suffixIcon: _phoneController.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: Icon(
                          Icons.disabled_by_default_outlined,
                          color: primaryColor,
                        ),
                        onPressed: () => _phoneController.clear(),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Tiếp tục',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    OtpScreen.routeName,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
