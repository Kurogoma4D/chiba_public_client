import 'package:flutter/material.dart';

import 'pages/home_page/home_page.dart';

class AppState {
  AppState({this.apiBasePath = ''});

  final String apiBasePath;
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chiba-city public facilities',
      home: HomePage.withDependencies(context),
    );
  }
}
