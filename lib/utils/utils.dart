import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/screens/payment/payment_success.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:winpe_pay/widgets/loader.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// for displaying snackbars
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: primaryColor,
      behavior: SnackBarBehavior.floating,
      content: Text(text),
    ),
  );
}

// for picking up image from gallery
pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No Image Selected');
}

//for displaying dialog
showDiaLog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      Future.delayed(
        Duration(seconds: 5),
        () {
          Navigator.of(context).pop(true);
        },
      );
      return LoaderLottie();
    },
  );
}

showDiaLogPayment(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      Future.delayed(
        Duration(seconds: 5),
        () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            PaymentSuccess.routeName,
            (route) => false,
          );
        },
      );
      return Loader();
    },
  );
}

showDiaLogGift(
  BuildContext context,
  String title,
  String desc,
  Image image,
) {
  // Reusable alert style
  var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: textStandardBlack,
      animationDuration: Duration(milliseconds: 400),
      titleStyle: textStandardBoldBlack,
      constraints: BoxConstraints.expand(width: 300),
      alertAlignment: Alignment.center);
  // Alert dialog using custom alert style
  Alert(
    context: context,
    style: alertStyle,
    title: title,
    desc: desc,
    image: image,
    buttons: [
      DialogButton(
        child: Text(
          "Đóng",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: primaryColor,
        radius: BorderRadius.circular(0.0),
      ),
    ],
  ).show();
}
