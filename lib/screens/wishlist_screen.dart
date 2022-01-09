import 'package:flutter/material.dart';
import 'package:hdsl/widget/history_card.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => SizedBox(
            height: 0,
          ),
          itemBuilder: (context, index) {
            return HistoryCard();
          },
        ));
  }
}
