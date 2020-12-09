import 'package:flutter/material.dart';
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
    print('build: ');
    print(contacts);
    if (contacts != null) {
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
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Contactos'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, children: []),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new').then(onGoBack);
          },
          backgroundColor: Colors.blue[400],
          child: Icon(Icons.add),
        ),
      );
    }
  }

  Future<void> onGoBack(dynamic value) async {
    contacts = await DbHelper.instance.queryAll();
    setState(() {});
  }

  Future<void> getContacts() async {
    contacts = await DbHelper.instance.queryAll();
    print('getcontacts');
  }

  Widget contactListRow(BuildContext context, Map contact) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
          padding: EdgeInsets.fromLTRB(30, 25, 25, 25),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  '${contact['name']} ${contact['lastname']}',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/view', arguments: {
                        'contact': contact,
                        'id': contact['id']
                      }).then(onGoBack);
                    },
                    icon: Icon(Icons.remove_red_eye),
                    label: Text('')),
              )
            ],
          )),
    );
  }
}
