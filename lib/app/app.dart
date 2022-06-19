import 'package:flutter/material.dart';

import '../persentation/resources/routes_manager.dart';
import '../persentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  //named constructor
  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); //singleton or singel instance

  factory MyApp() => _instance; //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
