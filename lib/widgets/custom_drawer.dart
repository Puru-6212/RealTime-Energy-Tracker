// lib/widgets/custom_drawer.dart
import 'package:flutter/material.dart';
import '../screens/insights_page.dart';
import '../screens/energy_consumption_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Energify Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Insights'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsightsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: Text('Energy Consumption'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EnergyConsumptionScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
