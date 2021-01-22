import 'package:flutter/material.dart';
import 'package:formulario/models/service.dart';
import 'package:formulario/widgets/serviceCard.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    var services = args['services'];
    if (services != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Servicios'),
        ),
        body: ListView(
          children: services
              .map<Widget>((element) => serviceCard(context, element))
              .toList(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Servicios'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Text('No hay resultados.')]),
      );
    }
  }
}
