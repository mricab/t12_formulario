import 'package:flutter/material.dart';
import 'package:formulario/models/query.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _formKey = GlobalKey<FormState>();
  var categories = ['Plomero', 'Carpintero', 'Albañil'];
  var scores = ['1', '2', '3', '4', '5'];
  var proximities = ['1 Km', '2 Km', '3 Km', '4 Km', '5 Km', '6 Km', '7 Km'];
  var regions = ['La Paz', 'Cochabamba', 'Santa Cruz'];
  String category;
  String score;
  String proximity;
  String region;
  Query _query = new Query();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Definir Búsqueda'),
        ),
        body: Container(
          padding: EdgeInsets.all(50.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // Categorias
                  DropdownButtonFormField<String>(
                    onSaved: (val) => _query.category = val,
                    value: category,
                    items: categories.map<DropdownMenuItem<String>>(
                      (String val) {
                        return DropdownMenuItem(
                          child: Text(val),
                          value: val,
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(() {
                        category = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Categoria',
                      icon: Icon(Icons.handyman),
                    ),
                  ),
                  // Calificación
                  DropdownButtonFormField<String>(
                    onSaved: (val) => _query.score = double.parse(val),
                    value: score,
                    items: scores.map<DropdownMenuItem<String>>(
                      (String val) {
                        return DropdownMenuItem(
                          child: Text(val),
                          value: val,
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(() {
                        score = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Puntaje Minimo',
                      icon: Icon(Icons.star),
                    ),
                  ),
                  // Proximidad
                  DropdownButtonFormField<String>(
                    onSaved: (val) =>
                        _query.proximity = double.parse(val.substring(0, 1)),
                    value: proximity,
                    items: proximities.map<DropdownMenuItem<String>>(
                      (String val) {
                        return DropdownMenuItem(
                          child: Text(val),
                          value: val,
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(() {
                        proximity = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Proximidad',
                      icon: Icon(Icons.near_me),
                    ),
                  ),
                  // Región
                  DropdownButtonFormField<String>(
                    onSaved: (val) => _query.region = val,
                    value: region,
                    items: regions.map<DropdownMenuItem<String>>(
                      (String val) {
                        return DropdownMenuItem(
                          child: Text(val),
                          value: val,
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(() {
                        region = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Region',
                      icon: Icon(Icons.location_pin),
                    ),
                  ),
                  SizedBox(height: 35),
                  TextButton(
                    onPressed: () async {
                      _formKey.currentState.save();
                      _query.setReferencePoint(-17.783252, -63.181759);
                      if (_query.isSet()) {
                        var services = await _query.getQuery();
                        Navigator.pushNamed(context, '/list',
                            arguments: {'services': services});
                      }
                    },
                    child: Text('Buscar'),
                    style: TextButton.styleFrom(
                      primary: Colors.grey[100],
                      backgroundColor: Colors.blue,
                    ),
                  )
                ],
              )),
        ));
  }
}
