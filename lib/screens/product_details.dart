import 'package:hdsl/const.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  //String value = '0';
  TextEditingController quantityController = TextEditingController(text: '0');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                      onPressed: () {}, icon: Icon(Icons.favorite_border))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/furniture_logo.png',
                  height: size.height * .25,
                  width: size.width,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  padding: EdgeInsets.only(top: 20, left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Royal Garden Chair',
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'cormorant',
                                fontWeight: FontWeight.bold,
                                color: Color(textColor)),
                          ),
                          OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                  shape: StadiumBorder()),
                              onPressed: null,
                              icon: Icon(Icons.star),
                              label: Text('4.5'))
                        ],
                      ),
                      Text(
                        'Brand: RFL',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Text(
                          'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Quantity: ',
                            style: TextStyle(
                                color: Color(textColor),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                            shape: StadiumBorder(),
                            color: Color(btnColor),
                            onPressed: () {
                              if (int.parse(quantityController.text) > 0) {
                                int value = int.parse(quantityController.text);
                                quantityController.text =
                                    (value - 1).toString();
                                setState(() {});
                              }
                            },
                            child: Text(
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
                              decoration: InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                            color: Color(btnColor),
                            shape: StadiumBorder(),
                            onPressed: () {
                              int value = int.parse(quantityController.text);
                              quantityController.text = (value + 1).toString();
                              setState(() {});
                            },
                            child: Text(
                              '+',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('৳100.00',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              MaterialButton(
                                shape: StadiumBorder(),
                                color: Colors.lightGreen,
                                onPressed: () {},
                                child: Text(
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
}
