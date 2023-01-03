// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:review_app/presentation/screens/Offer/offer_screen.dart';
import 'package:review_app/presentation/screens/Trips/trips_screen.dart';
import 'package:review_app/presentation/screens/explore/explore_screen.dart';
import 'package:review_app/presentation/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main screen';
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentpage = 0;

  List<Widget> pages = [
    HomeScreen(),
    // ExploreScreen(),
    TripScreen(),
    OfferScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: currentpage,
        onTap: (value) {
          setState(() {
            currentpage = value;
          });
        },
        items: [
          TabItem(
              icon: Icon(
                Icons.home,
              ),
              title: 'Home'),
          // TabItem(
          //     icon: Icon(
          //       Icons.explore,
          //     ),
          //     title: 'Explore'),
          TabItem(
              icon: Icon(
                Icons.business_center,
              ),
              title: 'Trips'),
          TabItem(icon: Icon(Icons.card_giftcard), title: 'Offers'),
        ],
      ),
    );
  }
}
