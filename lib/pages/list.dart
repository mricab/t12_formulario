import 'package:flutter/material.dart';
import 'package:formulario/objects/list.dart';
import 'package:formulario/objects/contact.dart';
import 'package:formulario/templates/ContactListRow.dart';
import '../objects/Contacts.dart';
import 'package:formulario/db/db_helper.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  var contacts;

  @override
  Widget build(BuildContext context) {
    getContacts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contactos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: contacts
            .map<Widget>((element) => contactListRow(context, element))
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

  Future<void> onGoBack(dynamic value) {
    setState(() {});
  }

  void getContacts() async {
    contacts = await DbHelper.instance.queryAll();
    setState(() {});
  }
}
