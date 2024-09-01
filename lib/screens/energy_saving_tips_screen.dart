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

class EnergySavingTipsScreen extends StatefulWidget {
  @override
  _EnergySavingTipsScreenState createState() => _EnergySavingTipsScreenState();
}

class _EnergySavingTipsScreenState extends State<EnergySavingTipsScreen> {
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
    // Add more tips as needed
  ];

  late List<Map<String, String>> filteredTips;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredTips = energySavingTips;
  }

  void _filterTips(String query) {
    setState(() {
      searchQuery = query;
      filteredTips = energySavingTips
          .where((tip) =>
              tip['title']!.toLowerCase().contains(query.toLowerCase()) ||
              tip['description']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalized Energy Saving Tips'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: EnergySavingTipsSearchDelegate(energySavingTips),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: filteredTips.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                leading: Icon(Icons.lightbulb, color: Colors.green),
                title: Text(
                  filteredTips[index]['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(filteredTips[index]['description']!),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class EnergySavingTipsSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> energySavingTips;

  EnergySavingTipsSearchDelegate(this.energySavingTips);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = energySavingTips
        .where((tip) =>
            tip['title']!.toLowerCase().contains(query.toLowerCase()) ||
            tip['description']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.lightbulb, color: Colors.green),
          title: Text(results[index]['title']!),
          subtitle: Text(results[index]['description']!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = energySavingTips
        .where((tip) =>
            tip['title']!.toLowerCase().contains(query.toLowerCase()) ||
            tip['description']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.lightbulb, color: Colors.green),
          title: Text(suggestions[index]['title']!),
          subtitle: Text(suggestions[index]['description']!),
          onTap: () {
            query = suggestions[index]['title']!;
            showResults(context);
          },
        );
      },
    );
  }
}
