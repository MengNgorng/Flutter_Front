import 'package:flutter/material.dart';
import 'login_page.dart';

PreferredSizeWidget myAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.blue, // Set the background color to blue
    surfaceTintColor: Colors.transparent,
    title: Text(
      title,
      style: const TextStyle(
        fontFamily: 'Arial',
        color: Colors.white, // Text color to contrast the blue background
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.chat_rounded),
        tooltip: 'Message',
        color: Colors.white, // Set icon color to white
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.edit_notifications_rounded),
        tooltip: 'Notification',
        color: Colors.white, // Set icon color to white
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.qr_code_rounded),
        tooltip: 'QR Code',
        color: Colors.white, // Set icon color to white
        onPressed: () {},
      ),
    ],
  );
}

PreferredSizeWidget myAppBar2(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.blue, // Set the background color to blue
    iconTheme: const IconThemeData(color: Colors.white), // Set icon color to white
    surfaceTintColor: Colors.transparent,
    title: Center(
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Arial',
          color: Colors.white, // Text color to white
        ),
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: TextButton(
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.white, // Set logout text color to white
            ),
          ),
        ),
      ),
    ],
  );
}
