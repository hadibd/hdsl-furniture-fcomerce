// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hdsl/user.dart';
import 'package:hdsl/widget/wishlist_card.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  List wishListItems = [];
  @override
  void initState() {
    super.initState();
    getWishlistData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
      child: wishListItems.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Wishlist',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Product that you loved!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cormorant'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.separated(
                  itemCount: wishListItems.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return WishlistCard(
                      index: index,
                      itemsData: wishListItems,
                    );
                  },
                )),
              ],
            ),
    );
  }

  void getWishlistData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var wishList = await firestore
        .collection('whish-list')
        .doc(user_mail)
        .collection('items')
        .get();
    for (var item in wishList.docs) {
      wishListItems.add({
        'catagory': item['catagory'],
        'description': item['description'],
        'image': item['image'],
        'price': item['price'],
        'rating': item['rating'],
        'title': item['title'],
        'doc-id': item.reference.id
      });
    }
    setState(() {});
    print(wishListItems);
  }

  removeItem() {}
}
