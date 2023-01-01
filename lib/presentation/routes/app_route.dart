import 'package:flutter/material.dart';
import 'package:review_app/presentation/pages/auth_page/auth_page.dart';
import 'package:review_app/presentation/pages/login_page/login_page.dart';
import 'package:review_app/presentation/screens/home/components/single_page.dart';
import 'package:review_app/presentation/screens/main_screen.dart';
import 'package:review_app/presentation/pages/onBoardingpage/onboarding_page.dart';
import 'package:review_app/presentation/pages/signup_page/signup_page.dart';
import 'package:review_app/presentation/screens/home/home_screen.dart';
import 'package:review_app/presentation/screens/popular/popular_screen.dart';
import 'package:review_app/presentation/screens/profile/profile_screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case OnBoardingpage.routeName:
        return MaterialPageRoute(builder: (context) => OnBoardingpage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case SignupPage.routeName:
        return MaterialPageRoute(builder: (context) => SignupPage());
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (context) => MainScreen());
      case AuthPage.routeName:
        return MaterialPageRoute(builder: (context) => AuthPage());
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case PopularScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          PopularScreen? popularScreen =
              routeSettings.arguments as PopularScreen;
          return PopularScreen(type: popularScreen.type);
        });
      case SinglePage.routeName:
        return MaterialPageRoute(builder: (context) {
          final SinglePage? singlePage = routeSettings.arguments as SinglePage;
          return SinglePage(
            des: singlePage!.des,
            lat: singlePage.lat,
            lng: singlePage.lng,
            image: singlePage.image,
            location: singlePage.location,
            name: singlePage.name,
            price: singlePage.price,
            amenities: singlePage.amenities,
            features: singlePage.features,
            // rating: singlePage.rating
          );
        });

      default:
    }
  }
}
