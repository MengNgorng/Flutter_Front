import 'package:flutter/material.dart';
import 'package:starter/ProductList.dart';
import 'package:starter/login.dart';
import 'dashboard_page.dart';
import 'login_page.dart';

Widget myDrawer(BuildContext context) {
  bool light0 = true;
  bool light1 = true;

  final MaterialStateProperty<Icon?> thumbIcon = MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  return Drawer(
    backgroundColor: Theme.of(context).colorScheme.onSurface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    child: Column(
      children: [
        _buildDrawerHeader(context),
        _buildDrawerItem(context, Icons.home_rounded, "Dashboard", DashboardPage()),
        _buildDrawerItem(context, Icons.person_rounded, "Profile", null),
        _buildDrawerItem(context, Icons.production_quantity_limits_sharp, "Product", ProductList()),
        _buildDrawerItem(context, Icons.contact_mail_rounded, "Contact Us", null),
        _buildDrawerItem(context, Icons.settings_rounded, "Settings", null),
        _buildDrawerItem(context, Icons.logout_rounded, "Log out", MyLogin()),
        Spacer(),
        Divider(),
      ],
    ),
  );
}

Widget _buildDrawerHeader(BuildContext context) {
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(),
    accountName: Text(
      "Kim MengNgorng",
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
    ),
    accountEmail: Text(
      "mengngorngkim@gmail.com",
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
    ),
    currentAccountPicture: const CircleAvatar(
      backgroundImage: NetworkImage(
        "https://i.pinimg.com/736x/57/7c/b3/577cb379091735c4248375eaa13ce254.jpg",
      ),
    ),
  );
}

Widget _buildDrawerItem(BuildContext context, IconData icon, String title, Widget? destination) {
  return ListTile(
    leading: Icon(
      icon,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    title: Text(
      title,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
    ),
    onTap: () {
      if (destination != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      } else {
        print('No destination provided for $title');
      }
    },
  );
}
