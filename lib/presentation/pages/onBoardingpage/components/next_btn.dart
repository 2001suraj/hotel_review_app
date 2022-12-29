// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:review_app/presentation/pages/login_page/login_page.dart';

class NextBtn extends StatefulWidget {
  NextBtn({Key? key, required this.animationController, required this.next})
      : super(key: key);
  final AnimationController animationController;
  final VoidCallback next;

  @override
  State<NextBtn> createState() => _NextBtnState();
}

class _NextBtnState extends State<NextBtn> {
  int ii = 1;
  @override
  @override
  Widget build(BuildContext context) {
    final top_animation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );
    final signupAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );
    final loginanimation = Tween<Offset>(
        begin: Offset(0, 5),
        end: Offset(
          0,
          0,
        )).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: top_animation,
          child: AnimatedBuilder(
            animation: widget.animationController,
            builder: (context, child) {
              return AnimatedOpacity(
                opacity: widget.animationController.value >= 0.2 &&
                        widget.animationController.value <= 0.6
                    ? 1
                    : 0,
                duration: Duration(milliseconds: 400),
                child: pages(),
              );
            },
          ),
        ),
        SlideTransition(
          position: top_animation,
          child: AnimatedBuilder(
              animation: widget.animationController,
              builder: (context, child) {
                return Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xff132137)),
                  child: signupAnimation.value > 0.7
                      ? InkWell(
                          key: ValueKey('sign Up Button'),
                          onTap: widget.next,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign up ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      : InkWell(
                          key: ValueKey('next button'),
                          onTap: widget.next,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )),
                );
              }),
        ),
        SlideTransition(
          position: loginanimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have ann account ? '),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginPage.routeName);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget pages() {
    int selectindex = 0;
    if (widget.animationController.value >= 0.7) {
      selectindex = 3;
    } else if (widget.animationController.value >= 0.5) {
      selectindex = 2;
    } else if (widget.animationController.value >= 0.3) {
      selectindex = 1;
    } else if (widget.animationController.value >= 0.1) {
      selectindex = 0;
    }
    return SizedBox(
      width: 220,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 4; i++)
            AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 2),
              duration: Duration(milliseconds: 500),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: selectindex == i ? Color(0xff132137) : Colors.grey),
            ),
        ],
      ),
    );
  }
}
