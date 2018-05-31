import 'package:flutter/material.dart';
import 'package:test_login/screens/login_screen.dart';
import 'package:test_login/screens/home_screen.dart';

final routes = {
  '/': (BuildContext context) => new MyForm(),
  '/login': (BuildContext context) => new MyForm(),
  '/home': (BuildContext context) => new HomeScreen()
};