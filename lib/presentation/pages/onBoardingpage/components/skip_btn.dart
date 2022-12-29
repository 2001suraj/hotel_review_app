// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SkipBtn extends StatelessWidget {
  SkipBtn(
      {Key? key,
      required this.animationController,
      required this.back,
      required this.skip})
      : super(key: key);
  final AnimationController animationController;
  final VoidCallback back;
  final VoidCallback skip;

  @override
  Widget build(BuildContext context) {
    final animation1 = Tween<Offset>(
        begin: Offset(0, -1),
        end: Offset(
          0.0,
          0.0,
        )).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );
    final skipanimation = Tween<Offset>(
            begin: Offset(
              0,
              0,
            ),
            end: Offset(2, 0))
        .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );
    return SlideTransition(
      position: animation1,
      child: Padding(
        padding: const EdgeInsets.only(right: 38.0, left: 38, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: back,
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
            SlideTransition(
              position: skipanimation,
              child: IconButton(
                  onPressed: skip,
                  icon: Text(
                    'skip',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
