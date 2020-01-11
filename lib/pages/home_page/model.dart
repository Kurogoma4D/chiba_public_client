import 'package:flutter/material.dart';

import '../../app.dart';

class Model extends ChangeNotifier {
  Model({this.state}) : _str = '' {
    _fetchCategories();
  }

  final AppState state;
  String _str;
  String get str => _str;

  void _fetchCategories() {
    Future<void>.delayed(const Duration(seconds: 3)).then((_) {
      print('three');
      _str = 'three';
      notifyListeners();
    });
  }
}
