import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(Provider(
    create: (context) => AppState(
      apiBasePath: 'localhost:8000',
    ),
    child: const App(),
  ));
}
