import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Temp2_FireBase extends StatefulWidget {
  const Temp2_FireBase({super.key});
  static const routeName = '/temp2_firebase';

  @override
  State<Temp2_FireBase> createState() => _TempFirebaseHTTPState();
}

class _TempFirebaseHTTPState extends State<Temp2_FireBase> {
  double temperature = -1;
  double humidity = -1;

  Future<void> fetchData() async {
    final url = Uri.parse('https://test-5e578-default-rtdb.firebaseio.com/sensor.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          temperature = data['temperature'] ?? -1;
          humidity = data['humidity'] ?? -1;
        });
      } else {
        print('HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🔥 Firebase Data via HTTP")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("🌡 Temperature", style: TextStyle(fontSize: 25)),
            Text("$temperature °C",
                style: const TextStyle(fontSize: 40, color: Colors.red)),
            const SizedBox(height: 20),
            const Text("💧 Humidity", style: TextStyle(fontSize: 25)),
            Text("$humidity %",
                style: const TextStyle(fontSize: 40, color: Colors.blue)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: fetchData,
              child: const Text("🔄 Refresh"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Temperature Control',
    home: Temp2_FireBase(),
  ));
}