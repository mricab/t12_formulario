import 'package:flutter/material.dart';
import 'pages/list.dart';
import 'pages/new.dart';
import 'pages/view.dart';
import 'pages/search.dart';

void main() async {
  runApp(MaterialApp(
    initialRoute: '/search',
    routes: {
      '/search': (context) => Search(),
      '/list': (context) => List(),
      '/new': (context) => New(),
      '/view': (context) => View(),
    },
  ));
}
