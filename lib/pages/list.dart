import 'package:flutter/material.dart';
import 'package:formulario/templates/ContactListRow.dart';
import '../objects/list.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contactos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: contacts
            .map((contact) => contactListRow(context, contact))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new').then(onGoBack);
        },
        backgroundColor: Colors.blue[400],
        child: Icon(Icons.add),
      ),
    );
  }

  Future onGoBack(dynamic value) {
    setState(() {});
  }
}
