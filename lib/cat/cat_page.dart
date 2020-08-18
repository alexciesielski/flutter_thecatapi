import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thecatapi/cat/cat_bloc.dart';
import 'package:flutter_thecatapi/cat/cat_grid.dart';

class CatPage extends StatelessWidget {
  CatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catBloc = CatBloc();
    catBloc.queryCats();
    return StreamBuilder(
      stream: catBloc.cats,
      builder: (context, snapshot) {
        return CatGrid(cats: snapshot.data);
      },
    );
  }
}
