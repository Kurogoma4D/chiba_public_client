import 'dart:convert';

import 'package:chiba_public_client/models/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../app.dart';

class Model extends ChangeNotifier {
  Model({this.state}) : _categories = [] {
    _fetchCategories();
  }

  final AppState state;
  List<Category> _categories;
  List<Category> get categories => _categories;

  void _fetchCategories() {
    http.get(Uri.http(state.apiBasePath, '/api/categories')).then((response) {
      if (response.statusCode == 200) {
        final payload = json.decode(response.body) as List<dynamic>;
        _categories = payload
            .map((dynamic category) =>
                Category.fromJson(category as Map<String, dynamic>))
            .toList(growable: false);
        notifyListeners();
      } else {
        throw Exception('Falied to load categories.');
      }
    });
  }

  void onPanelTapped(BuildContext context, int index) {}
}
