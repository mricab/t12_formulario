import 'package:flutter/material.dart';
import 'pages/list.dart';
import 'pages/new.dart';
import 'pages/view.dart';
import 'package:formulario/db/db_helper.dart';

void main() async {
  runApp(MaterialApp(
    initialRoute: '/list',
    routes: {
      '/list': (context) => List(),
      '/new': (context) => New(),
      '/view': (context) => View(),
    },
  ));
}
