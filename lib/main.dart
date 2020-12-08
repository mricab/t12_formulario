import 'package:flutter/material.dart';
import 'pages/list.dart';
import 'pages/new.dart';
import 'pages/view.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/list',
    routes: {
      '/list': (context) => List(),
      '/new': (context) => New(),
      '/view': (context) => View(),
    },
  ));
}
