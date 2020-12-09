import 'package:flutter/material.dart';
import 'package:formulario/db/db_helper.dart';
import 'package:validators/validators.dart';

class New extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  TextEditingController name = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Contacto'),
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: new InputDecoration(labelText: 'Nombres'),
              ),
              TextField(
                controller: lastname,
                decoration: new InputDecoration(labelText: 'Apellido'),
              ),
              TextField(
                controller: address,
                decoration: new InputDecoration(labelText: 'Dirección'),
              ),
              TextField(
                controller: phone,
                decoration: new InputDecoration(labelText: 'Telefono'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () async {
                  if (!isNull(name.text) &&
                      !isNull(lastname.text) &&
                      !isNull(address.text) &&
                      isNumeric(phone.text)) {
                    var contact = {
                      'name': name.text,
                      'lastname': lastname.text,
                      'address': address.text,
                      'phone': phone.text,
                    };
                    int i = await DbHelper.instance.insert(contact);
                    Navigator.pushReplacementNamed(context, '/view',
                        arguments: {'contact': contact, 'id': i});
                  }
                },
                child: Text('Grabar'),
                style: TextButton.styleFrom(
                  primary: Colors.grey[100],
                  backgroundColor: Colors.red,
                ),
              )
            ],
          )),
    );
  }
}
