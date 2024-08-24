import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EnergyConsumptionScreen extends StatelessWidget {
  const EnergyConsumptionScreen({super.key});
  final List<FlSpot> spots = const [
    FlSpot(0, 2.0),
    FlSpot(1, 2.5),
    FlSpot(2, 3.0),
    FlSpot(3, 2.8),
    FlSpot(4, 3.5),
    FlSpot(5, 3.0),
    FlSpot(6, 2.7),
    FlSpot(7, 3.1),
  ];

  final double currentReading = 2.8;
  final double perUnitPrice = 0.15;
  final double predictedBill = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Energy Consumption'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: EnergyCharts(spots: spots),
            ),
            const SizedBox(height: 16),
            _buildParameterCard('Current Meter Reading', '$currentReading kWh'),
            _buildParameterCard('Per Unit Price', 'Rs.${perUnitPrice.toStringAsFixed(2)}'),
            _buildParameterCard('Predicted Monthly Bill', 'Rs.${predictedBill.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildParameterCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 6.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.info, color: Colors.white),
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

class EnergyCharts extends StatelessWidget {
  final List<FlSpot> spots;

  const EnergyCharts({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 300,
        child: LineChart(
          LineChartData(
            gridData:const FlGridData(show: false),
            titlesData: const FlTitlesData(show: true),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: Colors.blue,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
