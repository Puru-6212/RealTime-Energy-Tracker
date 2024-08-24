import 'package:flutter/material.dart';
import 'screens/energy_meter_home_page.dart';

void main() => runApp(const EnergyMeterApp());

class EnergyMeterApp extends StatelessWidget {
  const EnergyMeterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Energy Meter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const EnergyMeterHomePage(),
    );
  }
}
