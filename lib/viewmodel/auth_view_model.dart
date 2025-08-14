import 'dart:developer' show log;
// import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign/model/user_model.dart';

class AuthViewModel {
  UserModel? currentuser;
  String? sininErrorMessage;
  String? sinupErroreMessage;
  Future signIn(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseuser = response.user;
      if (firebaseuser != null) {
        currentuser = UserModel.fromFirebaseUser(firebaseuser);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      log(e.code);
      sininErrorMessage = signinErroreMessage(e.code);
      return false;
    } catch (e) {
      sininErrorMessage = "un expected errore${e.toString()}";
      return false;
    }
  }

  Future signUp(String email, String password) async{
    try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
    } on FirebaseAuthException catch (e) {
      log(e.code);
      sinupErroreMessage = signupErroreMessage(e.code);
      return false;
    } catch (e) {
      sinupErroreMessage = "un expected errore${e.toString()}";
      return false;
    }
  }
}

String signinErroreMessage(String code) {
  switch (code) {
    case 'user-not-found':
      return 'No user found with this email. Please sign up.';

    case 'invalid-credential':
      return 'Incorrect password. Please try again or reset your password.';

    case 'invalid-email':
      return 'The email address is badly formatted.';

    case 'user-disabled':
      return 'This account has been disabled.';

    case 'too-many-requests':
      return 'Too many attempts. Please try again later.';

    default:
      return 'Login failed. Please try again. }';
  }
}

String signupErroreMessage(String code) {
  switch (code) {
    case 'email-already-in-use':
      return 'this mail already exxist please log in.';

    case 'operation-not-allowed':
      return 'Use only email to sign up.';

    case 'invalid-email':
      return 'The email address is not correct.';

    case 'user-disabled':
      return 'This account has been disabled.';

    case 'weak-password':
      return 'The password is week .';

    default:
      return 'error try again later }';
  }
}
