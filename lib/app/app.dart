import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  //named constructor
  const MyApp._internal();

  static final MyApp _instance =
      const MyApp._internal(); //singleton or singel instance

  factory MyApp() => _instance; //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
