import 'package:flutter/material.dart';
import 'package:hdsl/screens/product_details.dart';

class itemCard extends StatelessWidget {
  const itemCard({Key? key, required this.index, required this.topItemsData})
      : super(key: key);

  final index, topItemsData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ProductDetails()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        height: 150,
        child: Row(
          children: [
            Container(
                height: 150,
                width: 120,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffF6F7F8),
                ),
                child: Image.asset('assets/images/furniture_logo.png')),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    topItemsData[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        // fontFamily: 'cormorant',
                        fontSize: 16,
                        color: Color(0xff230338),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    topItemsData[index]['catagory'],
                    style:
                        const TextStyle(fontSize: 10, color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    topItemsData[index]['description'],
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
                        topItemsData[index]['price'],
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'pacifico',
                            color: Color(0xff230338),
                            fontWeight: FontWeight.bold),
                      ),
                      MaterialButton(
                        color: const Color(0xff161E54),
                        shape: const StadiumBorder(),
                        onPressed: () {},
                        child: const Text(
                          'Buy',
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
}
