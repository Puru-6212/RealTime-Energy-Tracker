import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energy Saving Tips',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: EnergySavingTipsScreen(),
    );
  }
}

class EnergySavingTipsScreen extends StatelessWidget {
  // Dummy data for energy-saving tips
  final List<Map<String, String>> energySavingTips = [
    {
      'title': 'Use LED Bulbs',
      'description':
          'LED bulbs use up to 80% less energy than traditional incandescent bulbs.'
    },
    {
      'title': 'Unplug Devices',
      'description': 'Unplug devices when not in use to save standby power.'
    },
    {
      'title': 'Adjust Thermostat',
      'description':
          'Set your thermostat to a comfortable, energy-efficient temperature, especially when you’re asleep or away from home.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalized Energy Saving Tips'),
      ),
      body: ListView.builder(
        itemCount: energySavingTips.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.lightbulb, color: Colors.green),
            title: Text(energySavingTips[index]['title']!),
            subtitle: Text(energySavingTips[index]['description']!),
            onTap: () {
              // Handle onTap if needed
            },
          );
        },
      ),
    );
  }
}
