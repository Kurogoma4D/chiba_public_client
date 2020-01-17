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
      body: ListView.builder(
        itemCount: model.categories.length,
        itemBuilder: (context, index) => FractionallySizedBox(
          widthFactor: 0.8,
          child: MaterialButton(
            onPressed: () => model.onPanelTapped(context, index),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                model.categories[index].name,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
