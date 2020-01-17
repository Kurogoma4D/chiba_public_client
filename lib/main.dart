import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(Provider(
    create: (context) => AppState(apiBasePath: '10.0.2.2:80', routes: {
      'root': '/',
      'detail': '/detail',
    }),
    child: const App(),
  ));
}
