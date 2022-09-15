import 'package:flutter/material.dart';
import 'package:winpe_pay/resources/firestore_methods.dart';
import 'package:winpe_pay/screens/search/widgets/app_bars.dart';
import 'package:winpe_pay/screens/search/widgets/search_card.dart';
import 'package:winpe_pay/screens/search/widgets/search_card_skelton.dart';
import 'package:winpe_pay/screens/voucher/voucher_detail.dart';
import 'package:winpe_pay/screens/voucher/widgets/gift_card_skelton.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FireStoreMethods fireStoreMethods = FireStoreMethods();
  bool _isLoading = false;
  List? listGift = [];
  @override
  void initState() {
    super.initState();
    loadingScreen();
    fetchSearchedProduct(listGift);
  }

  void loadingScreen() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      if (this.mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void fetchSearchedProduct(var resultGift) async {
    await fireStoreMethods.searchGift(
        context: context,
        searchQuery: widget.searchQuery,
        dataGift: resultGift);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearch(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Container(
                height: 230,
                child: _isLoading
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) =>
                            const SearchCardSkelton(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listGift!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dataGift = listGift![index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  VoucherDetail.routeName,
                                  arguments: dataGift,
                                );
                              },
                              child: SearchCard(dataGift: dataGift));
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
