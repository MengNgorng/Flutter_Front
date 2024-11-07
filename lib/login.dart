import 'package:flutter/material.dart';
import 'package:starter/dashboard.dart';
import 'package:starter/dashboard_page.dart';

void main() => runApp(MyLogin());

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color myColor = Color.fromRGBO(230, 0, 255, 1.0);
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        primaryColor: myColor,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: myColor,
          brightness: Brightness.light,
          secondary: myColor,
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: myColor,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: myColor,
          primary: myColor,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, // Set the background color
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Add padding to make it look nice
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo and title at the top
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfEjWfwKW_gnnDXdl2O21OfmqXwszngh4lKA&s',
              height: 100,
            ),
            SizedBox(height: 20), // Add some spacing
            Text(
              'Please Login to join onic',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40), // Add space before the form fields

            // Email input field
            TextField(
              decoration: InputDecoration(
                hintText: 'player@gmail.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20), // Space between email and password fields

            // Password input field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 30), // Space before the login button

            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyMenu()),
                  );
                },
                child: Text('LOGIN'),
              ),
            ),
            SizedBox(height: 10), // Space before the forgot password text

            // Forgot password text
            TextButton(
              onPressed: () {

                // Handle forgot password action
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ),
      ),
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
    );
  }
}
