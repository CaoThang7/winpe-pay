import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/widgets/loader.dart';

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
          Navigator.of(context).pop(true);
        },
      );
      return Loader();
    },
  );
}
