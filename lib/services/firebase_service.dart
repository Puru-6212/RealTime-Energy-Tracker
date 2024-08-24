import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/meter_data.dart';

class FirebaseService {
  final Uri fetchUrl = Uri.https('energy-meter-ccf5c-default-rtdb.firebaseio.com', 'energy-meter.json');
  final Uri postUrl = Uri.https('energy-meter-ccf5c-default-rtdb.firebaseio.com', 'energy-meter.json');

  Future<MeterData?> fetchMeterData() async {
    try {
      final response = await http.get(fetchUrl);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is Map<String, dynamic>) {
          return MeterData.fromJson(data);
        } else {
          print('Error: Data is not a Map');
        }
      } else {
        print('Error: Failed to load data, status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }

  Future<void> sendDummyData() async {
    try {
      final response = await http.put(
        postUrl,
        body: json.encode({
          'voltage': '230V',
          'current': '20A',
          'power': '2.3kW',
          'energy': '5.8kWh',
          'powerFactor': '0.95',
        }),
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Error: Failed to send data, status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }
}
