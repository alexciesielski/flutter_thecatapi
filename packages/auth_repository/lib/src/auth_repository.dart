import 'dart:async';

import 'package:localstorage/localstorage.dart';
import 'package:meta/meta.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final _controller = StreamController<AuthStatus>();
  final _storage = LocalStorage('catapi.json');

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    final authenticated = await _storage.getItem('authenticated');
    if (authenticated == true) {
      yield AuthStatus.authenticated;
    } else {
      yield AuthStatus.unauthenticated;
    }

    yield* _controller.stream;
  }

  Future<void> logIn({
    @required String username,
    @required String password,
  }) async {
    assert(username != null);
    assert(password != null);

    await Future.delayed(
        const Duration(milliseconds: 750), () => {_loggedIn()});
  }

  Future<void> logOut() {
    _controller.add(AuthStatus.unauthenticated);
    return _storage.clear();
  }

  void _loggedIn() {
    _controller.add(AuthStatus.authenticated);
    _storage.setItem('authenticated', true);
  }

  void dispose() => _controller.close();
}
