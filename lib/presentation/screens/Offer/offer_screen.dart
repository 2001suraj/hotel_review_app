import 'package:flutter/material.dart';

class OfferScreen extends StatelessWidget {
  static const String routeName = 'OfferScreen';
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/comming.png'),
          Text(
            'Comming Soon !!!',
            style: TextStyle(color: Colors.black, fontSize: 30),
          )
        ],
      ),
    );
  }
}
