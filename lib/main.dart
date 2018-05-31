import 'package:flutter/material.dart';
import 'package:test_login/utils/routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Connexion',
      initialRoute: '/',
      routes: routes,
    );
  }
}