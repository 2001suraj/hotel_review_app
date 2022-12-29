import 'package:flutter/material.dart';

class Dotindicator extends StatelessWidget {
  Dotindicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 10,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        color: isActive ? Colors.blueAccent : Colors.grey,
      ),
    );
  }
}
