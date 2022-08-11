import 'package:flutter/material.dart';
import 'package:winpe_pay/resources/auth_methods.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:winpe_pay/widgets/custom_button.dart';
import 'package:winpe_pay/widgets/text_field_input.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = '/otp-screen';
  final String verifiId;
  const OtpScreen({Key? key, required this.verifiId}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final AuthMethods authMethods = AuthMethods();
  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _otpController.addListener(() => setState(() {}));
  }

  void verifyOTP() {
    authMethods.verifyOTP(context, _otpController.text.trim(), widget.verifiId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: GlobalVariables.logoAppBig),
              SizedBox(
                height: 24,
              ),
              Text('Xác minh', style: textLogin),
              SizedBox(
                height: 10,
              ),
              Text(
                "Nhập mã OTP của bạn",
                style: textWelcomeBack,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldInput(
                      hintText: '',
                      textInputType: TextInputType.phone,
                      textEditingController: _otpController,
                      suffixIcon: _otpController.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              icon: Icon(
                                Icons.disabled_by_default_outlined,
                                color: primaryColor,
                              ),
                              onPressed: () => _otpController.clear(),
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: 'Đăng nhập',
                      onTap: () {
                        verifyOTP();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
