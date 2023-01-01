import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/business_logic/auth/auth_bloc.dart';
import 'package:review_app/business_logic/hotel/hotel_bloc.dart';
import 'package:review_app/business_logic/logout/logout_bloc.dart';
import 'package:review_app/business_logic/signup/signup_bloc.dart';
import 'package:review_app/data/repo/hotel_repo.dart';
import 'package:review_app/data/repo/user_repo.dart';
import 'package:review_app/presentation/pages/auth_page/auth_page.dart';
import 'package:review_app/presentation/pages/onBoardingpage/onboarding_page.dart';
import 'package:review_app/presentation/routes/app_route.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'business_logic/login/login_bloc.dart';

int? firstscreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  firstscreen = sharedPreferences.getInt('firstScreen');
  await sharedPreferences.setInt('firstScreen', 1);
  await Firebase.initializeApp();
  runApp(MyApp(appRoute: AppRoute()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.appRoute}) : super(key: key);
  AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(UserRepo()),
        ),
        BlocProvider(
          create: (context) => SignupBloc(UserRepo()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(UserRepo()),
        ),
        BlocProvider(
          create: (context) => HotelBloc(HotelRepo())..add(GetHotelEvent()),
        ),
        BlocProvider(
            create: (context) => AuthBloc(UserRepo())..add(AuthAddEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Review application',
        onGenerateRoute: appRoute.onGenerateRoute,
        initialRoute: firstscreen == 0 || firstscreen == null
            ? OnBoardingpage.routeName
            : AuthPage.routeName,
      ),
    );
  }
}
