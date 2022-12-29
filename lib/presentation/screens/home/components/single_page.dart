import 'package:flutter/material.dart';
import 'package:review_app/presentation/screens/main_screen.dart';

class SinglePage extends StatelessWidget {
  static const String routeName = 'single page';
  SinglePage(
      {Key? key,
      required this.des,
      required this.image,
      required this.location,
      required this.name,
      required this.price,
      required this.rating})
      : super(key: key);
  String name;
  String image;
  String des;
  String price;
  String rating;
  String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pushReplacementNamed(context, MainScreen.routeName);
          },
        ),
      ),
    );
  }
}
