import 'package:flutter/material.dart';

class AppState {
  final String apiBasePath;

  AppState({this.apiBasePath = ''});
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chiba-city public facilities',
      home: Scaffold(),
    );
  }
}
