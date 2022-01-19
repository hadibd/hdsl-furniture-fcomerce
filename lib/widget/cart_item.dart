import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hdsl/screens/cart_screen.dart';

import '../user.dart';

class CartItem extends StatelessWidget {
  final index, itemsData;

  const CartItem({
    Key? key,
    required this.index,
    required this.itemsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (_) => ProductDetails()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffF6F7F8),
            borderRadius: BorderRadius.circular(16)),
        height: 160,
        child: Row(
          children: [
            Container(
                height: 160,
                width: 120,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffffffff),
                ),
                child: Image.network(itemsData[index]['image'])),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    itemsData[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        // fontFamily: 'cormorant',
                        fontSize: 16,
                        color: Color(0xff230338),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'item: ${itemsData[index]['catagory']}',
                    style:
                        const TextStyle(fontSize: 10, color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    itemsData[index]['description'],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '৳ ${itemsData[index]['price']}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'pacifico',
                            color: Color(0xff230338),
                            fontWeight: FontWeight.bold),
                      ),
                      MaterialButton(
                        color: const Color(0xff161E54),
                        shape: const StadiumBorder(),
                        onPressed: () {
                          removeItemFromCart();
                        },
                        child: const Text(
                          'Remove',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  void removeItemFromCart() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection('users-cart')
        .doc(user_mail)
        .collection('cart')
        .doc(itemsData[index]['doc-id'])
        .delete()
        .then((value) => print('item deleted'));
  }
}
