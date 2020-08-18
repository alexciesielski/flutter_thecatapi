import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thecatapi/login/password.dart';
import 'package:flutter_thecatapi/login/username.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required AuthRepository authRepository,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        super(const LoginState());

  final AuthRepository _authRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    }
  }

  LoginState _mapUsernameChangedToState(
      LoginUsernameChanged event, LoginState state) {
    final username = Username.dirty(event.username);
    return state.copyWith(
        username: username, status: Formz.validate([state.password, username]));
  }

  LoginState _mapPasswordChangedToState(
      LoginPasswordChanged event, LoginState state) {
    final password = Password.dirty(event.password);
    return state.copyWith(
        password: password, status: Formz.validate([password, state.username]));
  }
}
