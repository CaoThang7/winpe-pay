import 'package:flutter/material.dart';
import 'package:winpe_pay/screens/login/widgets/styles.dart';

class NewsCard extends StatefulWidget {
  final data;
  const NewsCard({Key? key, required this.data}) : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.data['image']),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              widget.data['title'],
              style: textTitleMenuHome,
            ),
          )
        ],
      ),
    );
  }
}
