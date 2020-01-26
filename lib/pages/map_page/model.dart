import 'dart:convert';

import 'package:chiba_public_client/models/category.dart';
import 'package:chiba_public_client/models/facility.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../app.dart';

mixin CameraSettings {
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(35.613297, 140.113318),
    zoom: 14,
  );

  static CameraTargetBounds targetBounds = CameraTargetBounds(
    LatLngBounds(
      northeast: const LatLng(35.712735, 140.293673),
      southwest: const LatLng(35.510485, 140.022571),
    ),
  );
}

class Model extends ChangeNotifier {
  Model({this.state, this.category}) : _facilities = [] {
    _fetchFacilities();
  }

  final AppState state;
  final Category category;
  List<Facility> _facilities;
  List<Facility> get facilities => _facilities;
  Set<Marker> _markers;
  Set<Marker> get markers => _markers;

  GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;
  set mapController(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

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

  void onMapCreated(GoogleMapController controller) {
    if (_facilities.isEmpty) {
      return;
    }

    final _markersList = <Marker>[];
    for (final facility in _facilities) {
      final marker = Marker(
        markerId: MarkerId(facility.id.toString()),
        position: LatLng(facility.latitude, facility.longitude),
        infoWindow: InfoWindow(
          title: facility.name,
          snippet: facility.address,
        ),
      );

      _markersList.add(marker);
    }

    _markers = Set.from(_markersList);
    notifyListeners();
  }
}
