import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/search/search_screen.dart';
import 'package:winpe_pay/utils/global_variable.dart';

AppBar AppBarVoucher(BuildContext context) {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 42,
            child: Material(
              borderRadius: BorderRadius.circular(7),
              elevation: 1,
              child: TextFormField(
                onFieldSubmitted: navigateToSearchScreen,
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 6,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 23,
                      ),
                    ),
                  ),
                  suffixIcon: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Icon(
                          Icons.qr_code_scanner,
                          color: Colors.black54,
                          size: 24,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Icon(
                          Icons.mic_none_rounded,
                          color: Colors.black54,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(top: 10),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black38,
                      width: 1,
                    ),
                  ),
                  hintText: 'Tìm kiếm',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
