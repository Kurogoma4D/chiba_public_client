import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class HomePage extends StatelessWidget {
  const HomePage._({Key key}) : super(key: key);

  static Widget withDependencies(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_context) => Model(
        state: Provider.of(context),
      ),
      child: const HomePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('sample'),
      ),
      body: Center(
        child: Text(model.str),
      ),
    );
  }
}
