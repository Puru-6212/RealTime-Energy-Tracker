// lib/screens/energy_meter_screen.dart
import 'package:flutter/material.dart';
import 'package:project/widgets/custom_drawer.dart';
// import 'package:project/screens/insights_page.dart';
// import 'package:project/screens/energy_consumption_screen.dart';

class EnergyMeterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DIGITAL ENERGY METER'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(), // Add your custom drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildMeterCard('Voltage', Icons.bolt),
            _buildMeterCard('Current', Icons.electrical_services),
            _buildMeterCard('Power', Icons.power),
            _buildMeterCard('Energy', Icons.battery_charging_full),
            _buildMeterCard('Power Factor', Icons.speed),
          ],
        ),
      ),
    );
  }

  Widget _buildMeterCard(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: TextStyle(fontSize: 18)),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Handle navigation or display detailed data
        },
      ),
    );
  }
}
