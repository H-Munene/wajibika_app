import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //signin
  Future<void> signup({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      String errorMessage = '';
      if(e.code == "weak-password") {
        errorMessage = 'Your password is too weak';
      }else if(e.code == "email-already-in-use"){
        errorMessage = "Emai is already registered";
      }

    } 
    catch (e) {
    }
  }

  //signout
}
