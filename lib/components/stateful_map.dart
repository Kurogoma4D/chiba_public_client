import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StatefulMap extends StatefulWidget {
  @override
  _StatefulMapState createState() => _StatefulMapState();
}

class _StatefulMapState extends State<StatefulMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(35.581893, 140.131368),
        zoom: 16,
      ),
      onMapCreated: _onMapCreated,
    );
  }

  void _onMapCreated(GoogleMapController controller) {}
}
