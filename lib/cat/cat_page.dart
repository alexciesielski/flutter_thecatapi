import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_thecatapi/auth/auth.dart';

class CatHomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CatHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'UserID: ${context.bloc<AuthBloc>().state.user.id}',
            ),
            RaisedButton(
              child: const Text('Logout'),
              onPressed: () {
                context.bloc<AuthBloc>().add(AuthLogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
