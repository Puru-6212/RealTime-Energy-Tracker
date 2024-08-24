import 'package:flutter/material.dart';

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Energy Insights'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildInsightCard('Total Consumption', '56.7 kWh', Icons.show_chart),
            _buildInsightCard('Average Power', '2.4 kW', Icons.trending_up),
            _buildInsightCard('Peak Consumption Time', '6:00 PM - 9:00 PM', Icons.access_time),
            _buildInsightCard('Power Factor Trend', '0.93', Icons.speed),
            _buildInsightCard('Voltage Stability', '230V ±5%', Icons.bolt),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightCard(String title, String value, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 6.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
