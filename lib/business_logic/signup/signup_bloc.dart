import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:review_app/data/repo/user_repo.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  UserRepo repo;
  SignupBloc(UserRepo userRepo)
      : repo = userRepo,
        super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupAddEvent) {
        emit(SignupLoadingState());
        try {
          var user =
              await repo.singup(email: event.email, password: event.password);
          emit(SignupSuccessState(user: user));
        } catch (e) {
          emit(SignupfailureState(message: e.toString()));
        }
      }
    });
  }
}
