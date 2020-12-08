import 'package:flutter/material.dart';
import 'package:formulario/objects/list.dart';
import '../objects/contact.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  Map args = {};
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    Contact contact = args['contact'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Icon(
              Icons.person,
              size: 80,
            ),
            Text(
              contact.name + ' ' + contact.lastname,
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('📱 ' + contact.phone, style: TextStyle(fontSize: 25)),
            Text('📍 ' + contact.address, style: TextStyle(fontSize: 25)),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                contacts.remove(args['contact']);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(context, '/list');
              },
              child: Text('Eliminar'),
              style: TextButton.styleFrom(
                primary: Colors.grey[100],
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
