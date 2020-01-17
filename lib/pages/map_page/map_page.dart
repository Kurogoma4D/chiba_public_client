import 'package:chiba_public_client/models/category.dart';
import 'package:flutter/material.dart';
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
    return Container();
  }
}
