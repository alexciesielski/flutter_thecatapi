import 'package:dio/dio.dart';
import 'package:flutter_thecatapi/cat/cat_model.ts';
import 'package:flutter_thecatapi/core/bloc.dart';
import 'package:rxdart/subjects.dart';

class CatBloc extends Bloc {
  CatBloc() {}

  final dio = Dio();
  final url = 'https://api.thecatapi.com/images/search';
  final token = 'c0fec9ff-2644-4884-9e8b-a11c0c8ee894';

  final _cats = BehaviorSubject<List<Cat>>.seeded([]);
  get cats => _cats.stream;

  void queryCats({limit: 20, page: 0}) async {
    try {
      final response =
          await dio.get(url, queryParameters: {limit: limit, page: page});

      print(response);
      _cats.sink.add(response.data);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  dispose() {
    _cats.close();
  }
}
