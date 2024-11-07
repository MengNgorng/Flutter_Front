import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF005d85),
          title: Text('ABA'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.chat),
              tooltip: 'Message',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notification_add),
              tooltip: 'Notification',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.qr_code),
              tooltip: 'QR Code',
              onPressed: () {},
            ),
          ],
        ),
        drawer: const Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Ngorng"),
                  accountEmail: Text("Ngorng@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text("Contact Us"),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Setting"),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Log out"),
                ),
              ],
            )),
        body: Column(
          children: [
            // Horizontal scrolling section (Top)
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.network(
                      "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/e4996ca9-03d4-4a65-8374-10ee99c5be23.jpeg",
                      width: 400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.network(
                      "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg",
                      width: 400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.network(
                      "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/e4996ca9-03d4-4a65-8374-10ee99c5be23.jpeg",
                      width: 400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.network(
                      "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg",
                      width: 400,
                    ),
                  ),
                ],
              ),
            ),

            // Vertical scrolling section (Below)
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.network(
                        "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/e4996ca9-03d4-4a65-8374-10ee99c5be23.jpeg",
                        width: 400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.network(
                        "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg",
                        width: 400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.network(
                        "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/e4996ca9-03d4-4a65-8374-10ee99c5be23.jpeg",
                        width: 400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.network(
                        "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg",
                        width: 400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),


      ),
    );
  }
}
