import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/business_logic/auth/auth_bloc.dart';
import 'package:review_app/presentation/pages/login_page/login_page.dart';
import 'package:review_app/presentation/pages/onBoardingpage/onboarding_page.dart';
import 'package:review_app/presentation/screens/main_screen.dart';

class AuthPage extends StatelessWidget {
  static const String routeName = 'Auth screen';
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitialState) {
            return OnBoardingpage();
          }
          else if (state is AuthloadingState) {
                return OnBoardingpage();
          }
          else if (state is AuthsuccessState) {
            return MainScreen();
          } else if (state is AuthfailureState) {
            return LoginPage();
          }
          return Container();
        },
      ),
    );
  }
}
