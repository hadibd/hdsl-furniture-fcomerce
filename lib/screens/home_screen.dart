import 'package:hdsl/screens/history_screen.dart';
import 'package:hdsl/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'store_screen.dart';
import 'wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.userId}) : super(key: key);
  final userId;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [StoreScreen(), WishList(), HistoryScreen(), ProfileScreen()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        elevation: 50,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profile'),
        ],
      ),
      body: SafeArea(child: pages[index]),
    );
  }
}
