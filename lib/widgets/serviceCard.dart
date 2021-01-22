import 'package:flutter/material.dart';
import 'package:formulario/models/service.dart';

Widget serviceCard(BuildContext context, Service service) {
  return Card(
    margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
    child: Padding(
        padding: EdgeInsets.fromLTRB(30, 25, 25, 25),
        child: Column(
          children: [
            //Nombre
            Expanded(
              flex: 5,
              child: Text(
                '${service.providerName}',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[800],
                ),
              ),
            ),
            //Category
            Expanded(
              flex: 5,
              child: Text(
                '${service.category}',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[800],
                ),
              ),
            ),
            //Score
            Expanded(
              flex: 5,
              child: Text(
                '${service.score}',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[800],
                ),
              ),
            ),
            //Distance
            Expanded(
              flex: 5,
              child: Text(
                '${service.distance}',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[800],
                ),
              ),
            ),
            //Region
            Expanded(
              flex: 5,
              child: Text(
                '${service.region}',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ],
        )),
  );
}
