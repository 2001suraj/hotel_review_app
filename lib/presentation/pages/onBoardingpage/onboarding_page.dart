import 'package:flutter/material.dart';
import 'package:review_app/presentation/pages/onBoardingpage/components/next_btn.dart';
import 'package:review_app/presentation/pages/onBoardingpage/components/onboard_screen1.dart';
import 'package:review_app/presentation/pages/onBoardingpage/components/onboard_screen2.dart';
import 'package:review_app/presentation/pages/onBoardingpage/components/onboard_screen3.dart';
import 'package:review_app/presentation/pages/onBoardingpage/components/skip_btn.dart';
import 'package:review_app/presentation/pages/onBoardingpage/components/splash_page.dart';
import 'package:review_app/presentation/pages/onBoardingpage/components/welcome_screen.dart';
import 'package:review_app/presentation/pages/signup_page/signup_page.dart';

class OnBoardingpage extends StatefulWidget {
  static const String routeName = ' onboarding page';
  const OnBoardingpage({Key? key}) : super(key: key);

  @override
  State<OnBoardingpage> createState() => _OnBoardingpageState();
}

class _OnBoardingpageState extends State<OnBoardingpage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController?.animateTo(0.0);

    super.initState();
  }

  bool f = true;

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRect(
        child: Stack(
          children: [
            SplashPage(animationController: animationController!),
            OnBoardScreen1(animationController: animationController!),
            OnBoardScreen2(animationController: animationController!),
            OnBoardScreen3(animationController: animationController!),
            WelcomeScreen(animationController: animationController!),
            SkipBtn(
                animationController: animationController!,
                back: onback,
                skip: onskip),
            NextBtn(animationController: animationController!, next: onnext),
          ],
        ),
      ),
    );
  }

  onnext() {
    if (animationController!.value >= 0 && animationController!.value <= 0.2) {
      animationController?.animateTo(0.4);
    } else if (animationController!.value > 0.2 &&
        animationController!.value <= 0.4) {
      animationController?.animateTo(0.6);
    } else if (animationController!.value > 0.4 &&
        animationController!.value <= 0.6) {
      animationController?.animateTo(0.8);
    } else if (animationController!.value > 0.6 &&
        animationController!.value <= 0.8) {
      Navigator.pushReplacementNamed(context, SignupPage.routeName);
    }
  }

  onback() {
    if (animationController!.value >= 0 && animationController!.value <= 0.2) {
      animationController!.animateTo(0.0);
    } else if (animationController!.value > 0.2 &&
        animationController!.value <= 0.4) {
      animationController!.animateTo(0.2);
    } else if (animationController!.value > 0.4 &&
        animationController!.value <= 0.6) {
      animationController!.animateTo(0.4);
    } else if (animationController!.value > 0.6 &&
        animationController!.value <= 0.8) {
      animationController!.animateTo(0.6);
    } else if (animationController!.value > 0.8 &&
        animationController!.value <= 1.0) {
      animationController!.animateTo(0.8);
    }
  }

  onskip() {
    animationController!.animateTo(0.8, duration: Duration(milliseconds: 120));
  }
}
