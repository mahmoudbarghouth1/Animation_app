import 'dart:developer' show log;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends StateNotifier<UserModel?> {
  AuthViewModel() : super(null);

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
        state = UserModel.fromFirebaseUser(firebaseuser);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      
      log(e.code);
      sininErrorMessage = signinErroreMessage(e.code);
      return false;
    } catch (e) {
      sininErrorMessage = "un expected errore";
      return false;
    }
  }

  Future signUp(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final firebaseuser = response.user;
      if (firebaseuser != null) {
        state = UserModel.fromFirebaseUser(firebaseuser);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      log(e.code);
      sinupErroreMessage = signupErroreMessage(e.code);
      return false;
    } catch (e) {
      sinupErroreMessage = "un expected errore";
      return false;
    }
  }
}

String signinErroreMessage(String code) {
  switch (code) {
    case 'invalid-credential':
      return 'invalid password or email Please try again or sign up.';

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
    case 'channel-error':
      return 'please input data .';

    default:
      return 'error try again later }';
  }
}

// ✅ IMPROVED CODE - Add these interfaces and implementations below:

// 1. Create proper interfaces for better testability and dependency injection
// abstract class IAuthService {
//   Future<AuthResult> signIn(String email, String password);
//   Future<AuthResult> signUp(String email, String password);
//   Stream<User?> get authStateChanges;
// }

// abstract class IAuthViewModel {
//   Future<AuthResult> signIn(String email, String password);
//   Future<AuthResult> signUp(String email, String password);
//   UserModel? get currentUser;
// }

// 2. Create proper result types instead of boolean returns
// sealed class AuthResult {
//   const AuthResult();
// }

// class AuthSuccess extends AuthResult {
//   final UserModel user;
//   const AuthSuccess(this.user);
// }

// class AuthFailure extends AuthResult {
//   final String message;
//   final String? code;
//   const AuthFailure(this.message, [this.code]);
// }

// 3. Create proper state management
// sealed class AuthState {
//   const AuthState();
// }

// class AuthInitial extends AuthState {}
// class AuthLoading extends AuthState {}
// class AuthAuthenticated extends AuthState {
//   final UserModel user;
//   const AuthAuthenticated(this.user);
// }
// class AuthUnauthenticated extends AuthState {}

// 4. Improved AuthViewModel with proper MVVM
// class AuthViewModel extends StateNotifier<AuthState> implements IAuthViewModel {
//   final IAuthService _authService;
  
//   AuthViewModel(this._authService) : super(AuthInitial());
  
//   @override
//   Future<AuthResult> signIn(String email, String password) async {
//     state = AuthLoading();
//     try {
//       final result = await _authService.signIn(email, password);
//       if (result is AuthSuccess) {
//         state = AuthAuthenticated(result.user);
//       }
//       return result;
//     } catch (e) {
//       final failure = AuthFailure('An unexpected error occurred');
//       return failure;
//     }
//   }
  
//   @override
//   Future<AuthResult> signUp(String email, String password) async {
//     state = AuthLoading();
//     try {
//       final result = await _authService.signUp(email, password);
//       if (result is AuthSuccess) {
//         state = AuthAuthenticated(result.user);
//       }
//       return result;
//     } catch (e) {
//       final failure = AuthFailure('An unexpected error occurred');
//       return failure;
//     }
//   }
  
//   @override
//   UserModel? get currentUser {
//     final state = this.state;
//     if (state is AuthAuthenticated) return state.user;
//     return null;
//   }
// }

// 5. Firebase service implementation
// class FirebaseAuthService implements IAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
  
//   @override
//   Future<AuthResult> signIn(String email, String password) async {
//     try {
//       final credential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
      
//       if (credential.user != null) {
//         return AuthSuccess(UserModel.fromFirebaseUser(credential.user!));
//       }
//       return const AuthFailure('Sign in failed');
//     } on FirebaseAuthException catch (e) {
//       return AuthFailure(_getErrorMessage(e.code), e.code);
//     } catch (e) {
//       return const AuthFailure('An unexpected error occurred');
//     }
//   }
  
//   @override
//   Future<AuthResult> signUp(String email, String password) async {
//     try {
//       final credential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
      
//       if (credential.user != null) {
//         return AuthSuccess(UserModel.fromFirebaseUser(credential.user!));
//       }
//       return const AuthFailure('Sign up failed');
//     } on FirebaseAuthException catch (e) {
//       return AuthFailure(_getErrorMessage(e.code), e.code);
//     } catch (e) {
//       return const AuthFailure('An unexpected error occurred');
//     }
//   }
  
//   @override
//   Stream<User?> get authStateChanges => _auth.authStateChanges();
// }

// 6. Improved error message handling
// String _getErrorMessage(String code) {
//   switch (code) {
//     case 'invalid-credential':
//       return 'Invalid password or email. Please try again or sign up.';
//     case 'invalid-email':
//       return 'The email address is badly formatted.';
//     case 'user-disabled':
//       return 'This account has been disabled.';
//     case 'too-many-requests':
//       return 'Too many attempts. Please try again later.';
//     case 'email-already-in-use':
//       return 'This email already exists. Please log in.';
//     case 'operation-not-allowed':
//       return 'Use only email to sign up.';
//     case 'weak-password':
//       return 'The password is weak.';
//     case 'channel-error':
//       return 'Please input data.';
//     default:
//       return 'An error occurred. Please try again later.';
//   }
// }
