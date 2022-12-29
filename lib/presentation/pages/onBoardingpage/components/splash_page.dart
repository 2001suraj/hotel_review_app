// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key, required this.animationController}) : super(key: key);
  final AnimationController animationController;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final animation1 =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -1.0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );
    return SlideTransition(
      position: animation1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Image(
                  image: AssetImage('assets/images/splash.jpeg'),
                  fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  '''Be informative and insightful: Be specific and relevant to the place that you're reviewing, and describe what other visitors are likely to experience. ...''',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.animationController.animateTo(0.2);
              },
              child: Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 58, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff132137),
                ),
                child: Text(
                  'Let\'s begin',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
