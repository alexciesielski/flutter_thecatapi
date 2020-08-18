import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thecatapi/cat/cat_model.ts';

class CatGrid extends StatelessWidget {
  CatGrid({this.cats});

  final List<Cat> cats;

  @override
  Widget build(BuildContext context) {
    final len = cats.length ?? -1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Cats'),
      ),
      body: Column(
        children: [
          Text('$len'),
        ],
      ),
    );
  }
}
