import 'package:flutter/material.dart';

class TripScreen extends StatelessWidget {
  static const String routeName = 'TripScreen';
  const TripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/fuse.png'),
          Text(
            'Comming Soon !!!',
            style: TextStyle(color: Colors.white, fontSize: 30),
          )
        ],
      ),
    );
  }
}
