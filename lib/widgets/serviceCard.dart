import 'package:flutter/material.dart';
import 'package:formulario/models/service.dart';

Widget serviceCard(BuildContext context, Service service) {
  return Card(
    margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
    child: Padding(
      padding: EdgeInsets.fromLTRB(30, 25, 25, 25),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.amber,
                backgroundImage: NetworkImage('${service.photo}'),
              )),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  //Nombre
                  Text(
                    '${service.providerName}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  //Category
                  Text(
                    '${service.category}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  //Score
                  Text(
                    '⭐️ ${service.score}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  //Distance
                  Text(
                    '📍 ${service.distance} Km.',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  //Region
                  Text(
                    '${service.region}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              )),
        ],
      ),
    ),
  );
}
