import 'package:firebase_auth/firebase_auth.dart';

class UserRepo {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User> login({required String email, required String password}) async {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user!;
  }

  Future<User> singup({required String email, required String password}) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user!;
  }

  Future logout() {
    return auth.signOut();
  }

  Future<bool> isSignin() async {
    var user = await auth.currentUser;
    return user != null;
  }

  Future getuser() async {
    var user = await auth.currentUser;
    return user;
  }

  Future getemail() async {
    var user = await auth.currentUser!.email;
    print('name=========>>>>>>>>>$user');
 
    return user;
  }
}
