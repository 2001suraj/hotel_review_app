part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  
  @override
  List<Object> get props => [];
}


//initial
class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}

//loading
class SignupLoadingState extends SignupState {
  @override
  List<Object> get props => [];
}

//success
class SignupSuccessState extends SignupState {
  User user;
  SignupSuccessState({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

//failure
class SignupfailureState extends SignupState {
  String message;
  SignupfailureState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}