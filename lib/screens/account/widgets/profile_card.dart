import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:winpe_pay/providers/user_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:winpe_pay/screens/account/edit_profile.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';
import 'package:winpe_pay/utils/colors.dart';
import 'package:winpe_pay/utils/global_variable.dart';
import 'package:winpe_pay/utils/utils.dart';
import 'dart:io';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final FireStoreMethods fireStoreMethods = FireStoreMethods();
  Uint8List? _image;
  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    showDiaLog(context);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
    uploadImage();
  }

  void uploadImage() {
    fireStoreMethods.uploadImage(file: _image!, context: context);
  }

  void navigateToEditProfile() {
    Navigator.pushNamed(context, EditProfile.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final uid = context.watch<UserProvider>().user;
    print("??? ${_image}");
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                selectImage();
              },
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                          backgroundColor: primaryColor,
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              '${uid?.photoUrl}'.isNotEmpty
                                  ? '${uid?.photoUrl}'
                                  : GlobalVariables().avatarProfile),
                          backgroundColor: primaryColor,
                        ),
                  Positioned(
                    bottom: 0,
                    left: 90,
                    child: Icon(
                      Icons.add_a_photo,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Số điện thoại: \n${uid?.phone}",
            style: textStandard,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Ngày tạo: \n${uid?.dateCreated}",
            style: textStandard,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Họ và tên:  \nThêm họ và tên",
                style: textStandard,
              ),
              IconButton(
                onPressed: () {
                  navigateToEditProfile();
                },
                icon: Icon(Icons.edit),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
