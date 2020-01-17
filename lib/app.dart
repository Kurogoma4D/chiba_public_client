import 'package:chiba_public_client/models/category.dart';
import 'package:chiba_public_client/pages/map_page/map_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page/home_page.dart';

class AppState {
  AppState({this.apiBasePath = '', this.routes});

  final String apiBasePath;
  final Map<String, String> routes;
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return MaterialApp(
      title: 'Chiba-city public facilities',
      initialRoute: state.routes['root'],
      routes: {
        state.routes['root']: HomePage.withDependencies,
        state.routes['detail']: (context) => MapPage.withDependencies(context,
            category: ModalRoute.of(context).settings.arguments as Category),
      },
    );
  }
}
