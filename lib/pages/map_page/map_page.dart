import 'package:chiba_public_client/models/category.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class MapPage extends StatelessWidget {
  const MapPage._({Key key}) : super(key: key);

  static Widget withDependencies(
    BuildContext context, {
    @required Category category,
  }) {
    return ChangeNotifierProvider(
      create: (_context) => Model(
        state: Provider.of(context),
        category: category,
      ),
      child: const MapPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    final appbar = AppBar(title: const Text('Detail'));
    return Scaffold(
      appBar: appbar,
      body: SizedBox.expand(
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(35.581893, 140.131368),
            zoom: 16,
          ),
          onMapCreated: model.onMapCreated,
          markers: model.markers,
        ),
      ),
    );
  }
}
