import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/business_logic/login/login_bloc.dart';
import 'package:review_app/data/local_storage/share_preference.dart';
import 'package:review_app/presentation/pages/login_page/login_page.dart';
import 'package:review_app/presentation/screens/main_screen.dart';
import 'package:review_app/presentation/pages/signup_page/signup_page.dart';
import 'package:review_app/presentation/screens/home/home_screen.dart';
import 'package:review_app/presentation/widgets/custom_btn.dart';
import 'package:review_app/presentation/widgets/normal_textfiled.dart';
import 'package:review_app/presentation/widgets/password_textField.dart';
import 'package:review_app/presentation/widgets/show_snack_bar.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'login page';
  LoginPage({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/signup.png'),
                ),
                Spacer(),
                NormalTextField(
                  controller: email,
                  text: 'Email',
                  iconData: Icons.email,
                ),
                SizedBox(
                  height: 30,
                ),
                PasswordTextFiled(controller: password),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.pushReplacementNamed(
                      //     context, ForgetpasswordScreen.routeName);
                    },
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Spacer(),
                BlocListener<LoginBloc, LoginState>(listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.pushReplacementNamed(
                        context, MainScreen.routeName);
                  } else if (state is LoginfailureState) {
                    showsnackBar(
                        context: context,
                        text: state.message,
                        color: Colors.red);
                  }
                }, child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginInitial) {
                      return Container();
                    } else if (state is LoginLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else if (state is LoginSuccessState) {
                      return Container();
                    } else if (state is LoginfailureState) {
                      return Container();
                    }
                    return Text('some error');
                  },
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 38.0, vertical: 15),
                  child: CustomBtn(
                    color: Colors.blueAccent,
                    textcolor: Colors.white,
                    tap: () {
                      context.read<LoginBloc>().add(LoginAddEvent(
                          email: email.text, password: password.text));
                      LocalStorage().writedata(text: email.text);
                    },
                    text: 'Log In',
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ? ',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignupPage.routeName);
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ))
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
