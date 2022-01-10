import 'package:flutter/material.dart';
import 'package:hdsl/screens/product_details.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
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
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
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
                  color: Color(0xffF6F7F8),
                ),
                child: Image.asset('assets/images/furniture_logo.png')),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Royal Garden Chair',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            // fontFamily: 'cormorant',
                            fontSize: 16,
                            color: Color(0xff230338),
                            fontWeight: FontWeight.w500),
                      ),
                      CloseButton(
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(
                    'Catagory',
                    style: TextStyle(fontSize: 10, color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '৳ 100',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'pacifico',
                            color: Color(0xff230338),
                            fontWeight: FontWeight.bold),
                      ),
                      MaterialButton(
                        color: Color(0xff161E54),
                        shape: const StadiumBorder(),
                        onPressed: () {},
                        child: Text(
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
