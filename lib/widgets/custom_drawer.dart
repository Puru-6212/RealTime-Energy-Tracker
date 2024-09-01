// lib/widgets/custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:project/screens/billings_screen';
import 'package:project/screens/energy_saving_tips_screen.dart';
import '../screens/insights_page.dart';
import '../screens/energy_consumption_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
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
          ListTile(
            leading: Icon(Icons.eco),
            title: Text('Energy Savings Tip'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EnergySavingTipsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.money_off_csred_outlined),
            title: Text('Billings Screen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BillingScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
