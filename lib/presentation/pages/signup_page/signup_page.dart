// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/business_logic/login/login_bloc.dart';
import 'package:review_app/business_logic/signup/signup_bloc.dart';
import 'package:review_app/data/local_storage/share_preference.dart';
import 'package:review_app/data/repo/cloud_storage.dart';
import 'package:review_app/presentation/pages/login_page/login_page.dart';
import 'package:review_app/presentation/screens/main_screen.dart';
import 'package:review_app/presentation/screens/home/home_screen.dart';
import 'package:review_app/presentation/widgets/custom_btn.dart';
import 'package:review_app/presentation/widgets/normal_textfiled.dart';
import 'package:review_app/presentation/widgets/password_textField.dart';
import 'package:review_app/presentation/widgets/show_snack_bar.dart';

class SignupPage extends StatelessWidget {
  static const String routeName = 'signup page';
  SignupPage({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
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
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/login.png'),
                ),
                Spacer(),
                NormalTextField(
                  controller: name,
                  text: 'Username',
                  iconData: Icons.person,
                ),
                Spacer(),
                NormalTextField(
                  controller: email,
                  text: 'Email',
                  iconData: Icons.email,
                ),
                Spacer(),
                PasswordTextFiled(controller: password),
                Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'By signing up you agree to our Terms of use and Piracy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                Spacer(),
                BlocListener<SignupBloc, SignupState>(
                    listener: (context, state) {
                  if (state is SignupSuccessState) {
                    Navigator.pushReplacementNamed(
                        context, MainScreen.routeName);
                  } else if (state is SignupfailureState) {
                    showsnackBar(
                        context: context,
                        text: state.message,
                        color: Colors.red);
                  }
                }, child: BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    if (state is SignupInitial) {
                      return Container();
                    } else if (state is SignupLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else if (state is SignupSuccessState) {
                      return Container();
                    } else if (state is SignupfailureState) {
                      return Container();
                    }
                    return Text('some error');
                  },
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 38.0, vertical: 15),
                  child: CustomBtn(
                    color: Colors.cyan,
                    textcolor: Colors.white,
                    tap: () async {
                      if (email.text.isNotEmpty &&
                          password.text.isNotEmpty &&
                          name.text.isNotEmpty) {
                        context.read<SignupBloc>().add(SignupAddEvent(
                            email: email.text, password: password.text));
                        CloudStorages().userinfo_update(
                            email: email.text, name: name.text);

                        LocalStorage().writedata(text: email.text);
                      } else {
                        showsnackBar(
                            context: context,
                            text: 'field is emply.',
                            color: Colors.orange);
                      }
                    },
                    text: 'Sign Up',
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, LoginPage.routeName);
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.blue,
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
