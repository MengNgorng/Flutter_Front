import 'package:flutter/material.dart';
import 'package:starter/appbar_widget.dart';
import 'package:starter/drawer_widget.dart';

void main() => runApp(MyMenu());

class MyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: myAppBar2(context, "Menu"),
        drawer: myDrawer(context),
        body: GridView.count(
          crossAxisCount: 2, // Two columns
          padding: EdgeInsets.all(8.0),
          children: List.generate(5, (index) {
            IconData? iconData; // Make iconData nullable
            String text = ''; // Initialize text

            switch (index) {
              case 0:
                iconData = Icons.person;
                text = 'User';
                break;
              case 1:
                iconData = Icons.contact_mail;
                text = 'Contact Us';
                break;
              case 2:
                iconData = Icons.group;
                text = 'Group';
                break;
              case 3:
                iconData = Icons.description; // Document icon
                text = 'Document';
                break;
              case 4:
                iconData = Icons.description_outlined; // List icon
                text = 'List';
                break;
            }

            return Card(
              color: Colors.blueAccent,
              margin: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(iconData, color: Colors.white, size: 40),
                  SizedBox(height: 8), // Space between icon and text
                  Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
