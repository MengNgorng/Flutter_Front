import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(8.0),
      children: List.generate(5, (index) {
        IconData? iconData;
        String text = '';

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
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, color: Colors.white, size: 40),
              const SizedBox(height: 8), // Space between icon and text
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        );
      }),
    );
  }
}
