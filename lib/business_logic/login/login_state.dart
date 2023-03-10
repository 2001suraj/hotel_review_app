// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

//initial
class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

//loading
class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

//success
class LoginSuccessState extends LoginState {
  User user;
  LoginSuccessState({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

//failure
class LoginfailureState extends LoginState {
  String message;
  LoginfailureState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
