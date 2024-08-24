import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EnergyChart extends StatelessWidget {
  final List<FlSpot> spots;

  const EnergyChart({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 300,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: true),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                //colors: [Colors.blue],
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
