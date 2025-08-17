
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/model/user_model.dart';
import 'package:sign/viewmodel/auth_view_model.dart';

final authViewerModelProvider =
    StateNotifierProvider<AuthViewModel, UserModel?>((ref) => AuthViewModel());
final bottomNavigatorProvider = StateProvider<int>((ref) =>0);

