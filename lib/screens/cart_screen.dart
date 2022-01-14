import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hdsl/widget/cart_item.dart';
import 'package:hdsl/widget/wishlist_card.dart';

import '../user.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();

  void updateData() {}
}

class _CartScreenState extends State<CartScreen> {
  List cartListItems = [];
  @override
  void initState() {
    super.initState();
    getWishlistData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
      child: cartListItems.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your cart has ${cartListItems.length} items',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.separated(
                  itemCount: cartListItems.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return CartItem(
                      index: index,
                      itemsData: cartListItems,
                    );
                  },
                )),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total: 300 ৳',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        color: const Color(0xff161E54),
                        shape: const StadiumBorder(),
                        onPressed: () => checkOut(),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void getWishlistData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var wishList = await firestore
        .collection('users-cart')
        .doc(user_mail)
        .collection('cart')
        .get();
    for (var item in wishList.docs) {
      cartListItems.add({
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
    // print(cartListItems);
  }

  checkOut() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users-cart')
        .doc(user_mail)
        .delete()
        .then((value) => print("User's Property Deleted"))
        .catchError(
            (error) => print("Failed to delete user's property: $error"));
    setState(() {});
    // print('object');
  }

  updateData() {
    setState(() {});
  }
}
