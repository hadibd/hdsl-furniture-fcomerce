import 'package:hdsl/const.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.description,
      required this.price,
      required this.rating,
      required this.catagory})
      : super(key: key);

  final String imgUrl, title, description, price, catagory, rating;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TextEditingController quantityController = TextEditingController(text: '1');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int price = int.parse(widget.price);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.favorite_border))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  widget.imgUrl,
                  height: size.height * .25,
                  width: size.width,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffF6F7F8),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 22,
                                fontFamily: 'cormorant',
                                fontWeight: FontWeight.bold,
                                color: Color(textColor)),
                          ),
                          OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              onPressed: null,
                              icon: const Icon(Icons.star),
                              label: const Text('4.5'))
                        ],
                      ),
                      Text(
                        'Catagory: ${widget.catagory}',
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Quantity: ',
                            style: TextStyle(
                                color: Color(textColor),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                            shape: const StadiumBorder(),
                            color: const Color(btnColor),
                            onPressed: () {
                              if (int.parse(quantityController.text) > 1) {
                                int value = int.parse(quantityController.text);
                                quantityController.text =
                                    (value - 1).toString();
                                price =
                                    int.parse(quantityController.text) * price;

                                setState(() {});
                                print(price);
                              }
                            },
                            child: const Text(
                              '-',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: quantityController,
                              decoration: const InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                            color: const Color(btnColor),
                            shape: const StadiumBorder(),
                            onPressed: () {
                              int value = int.parse(quantityController.text);
                              quantityController.text = (value + 1).toString();
                              price =
                                  int.parse(quantityController.text) * price;

                              setState(() {});
                              print(price);
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  '৳${int.parse(quantityController.text) * price}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              MaterialButton(
                                shape: const StadiumBorder(),
                                color: Colors.lightGreen,
                                onPressed: () {
                                  addToCart(price: price);
                                },
                                child: const Text(
                                  'Buy now',
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addToCart({required int price}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('users').doc(user_id).collection('cart').add({
      'catagory': widget.catagory,
      'description': widget.description,
      'image': widget.imgUrl,
      'price': '${int.parse(quantityController.text) * price}',
      'rating': widget.rating,
      'title': widget.title,
    });
  }
}
