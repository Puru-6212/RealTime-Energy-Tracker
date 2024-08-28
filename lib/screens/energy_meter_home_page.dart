import 'package:flutter/material.dart';
import 'package:project/screens/energy_consumption_screen.dart';
import 'package:project/screens/insights_page.dart';
import '../services/firebase_service.dart';
import '../models/meter_data.dart';
import '../widgets/data_card.dart';
import 'package:fl_chart/fl_chart.dart';

class EnergyMeterHomePage extends StatefulWidget {
  const EnergyMeterHomePage({super.key});
  @override
  EnergyMeterHomePageState createState() => EnergyMeterHomePageState();
}

class EnergyMeterHomePageState extends State<EnergyMeterHomePage> {
  MeterData? _meterData;
  final FirebaseService _firebaseService = FirebaseService();
  final List<FlSpot> _energySpots = [];
  //final double _perUnitPrice = 10.0; // Dummy value for per unit price
  //final double _predictedMonthlyBill = 150.0; // Dummy value for predicted bill

  @override
  void initState() {
    super.initState();
    _fetchMeterData();
    _simulateRealTimeData();
  }

  Future<void> _fetchMeterData() async {
    final data = await _firebaseService.fetchMeterData();
    print(data);
    setState(() {
      _meterData = data;
      _updateEnergySpots(); // Update the chart with new data
    });
  }

  void _updateEnergySpots() {
    // Update this logic to fetch real time data for chart
    setState(() {
      _energySpots.add(FlSpot(DateTime.now().millisecondsSinceEpoch.toDouble(),
          double.parse(_meterData?.energy.replaceAll('kWh', '') ?? '0')));
    });
  }

  void _simulateRealTimeData() {
    // Simulate data update every minute (for demonstration)
    Future.delayed(const Duration(minutes: 1), () {
      _firebaseService.sendDummyData().then((_) {
        _fetchMeterData();
        _simulateRealTimeData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Energy Meter'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Energy Meter Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Insights'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InsightsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.show_chart),
              title: const Text('Energy Consumption'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnergyConsumptionScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  if (_meterData != null) ...[
                    DataCard(
                        title: 'Voltage',
                        value: '${_meterData!.voltage}',
                        icon: Icons.bolt),
                    DataCard(
                        title: 'Current',
                        value: '${_meterData!.current}',
                        icon: Icons.electrical_services),
                    DataCard(
                        title: 'Power',
                        value: '${_meterData!.power}',
                        icon: Icons.power),
                    DataCard(
                        title: 'Energy',
                        value: '${_meterData!.energy}',
                        icon: Icons.energy_savings_leaf),
                    DataCard(
                        title: 'Power Factor',
                        value: '${_meterData!.powerFactor}',
                        icon: Icons.speed),
                  ] else ...[
                    const Center(child: CircularProgressIndicator()),
                  ]
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.sync,
                    color: Color.fromARGB(255, 0, 62, 79)),
                label: const Text('Simulate Real-Time Updates'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _sendDummyData,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendDummyData() {
    _firebaseService.sendDummyData().then((_) {
      _fetchMeterData();
      _showSnackBar();
    });
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('The data has been updated !!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
