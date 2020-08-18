import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thecatapi/app.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  runApp(App(
    authRepository: AuthRepository(),
    userRepository: UserRepository(),
  ));
}
