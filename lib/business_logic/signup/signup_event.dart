part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}
class SignupAddEvent extends SignupEvent {
  String email;
  String password;
  SignupAddEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
