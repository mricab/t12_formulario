import 'package:flutter/material.dart';
import '../objects/contact.dart';

Widget contactListRow(BuildContext context, Map contact) {
  print(contact);
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
                    Navigator.pushNamed(context, '/view',
                        arguments: {'contact': contact});
                  },
                  icon: Icon(Icons.remove_red_eye),
                  label: Text('')),
            )
          ],
        )),
  );
}
