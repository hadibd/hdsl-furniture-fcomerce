import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            child: Text('A'),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Zakaria Hossain'),
          const SizedBox(
            height: 8,
          ),
          Text('abc@mail.com'),
          const SizedBox(
            height: 8,
          ),
          Text('017629404'),
        ],
      ),
    ));
  }
}
