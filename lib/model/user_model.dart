import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String userId;
  final String? userEmail;
  final bool isValid;

  UserModel({
    required this.userId,
    required this.userEmail,
    required this.isValid,
  });
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      userId: user.uid,
      userEmail: user.email,
      isValid: user.emailVerified,
    );
  }
}
