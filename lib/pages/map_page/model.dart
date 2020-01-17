import 'dart:convert';

import 'package:chiba_public_client/models/category.dart';
import 'package:chiba_public_client/models/facility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../app.dart';

class Model extends ChangeNotifier {
  Model({this.state, this.category}) : _facilities = [] {
    _fetchFacilities();
  }

  final AppState state;
  final Category category;
  List<Facility> _facilities;
  List<Facility> get facilities => _facilities;

  void _fetchFacilities() {
    http
        .get(Uri.http(state.apiBasePath, '/api/facilities/',
            {'category': category.id.toString()}))
        .then((response) {
      if (response.statusCode == 200) {
        final payload = json.decode(response.body) as List<dynamic>;
        _facilities = payload
            .map((dynamic facility) =>
                Facility.fromJson(facility as Map<String, dynamic>))
            .toList(growable: false);
        notifyListeners();
      } else {
        throw Exception('Falied to load facilities.');
      }
    });
  }
}
