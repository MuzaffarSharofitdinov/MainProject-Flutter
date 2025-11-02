import 'dart:async';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class DataBase {
  final String id = "1";
  String s_temperature = "-1";
  String s_humidity = "-1";
  List data = [];

  Future<void> connect() async {
    final conn = PostgreSQLConnection(
      'postgres-smartboy.h.aivencloud.com',
      26207,
      'kafolat',
      username: 'avnadmin',
      password: 'AVNS_QHbuDuXH6nTNUi9IvFo',
      useSSL: true,
    );

    try {
      await conn.open();
      List<List<dynamic>> results = await conn.query(
        "SELECT s_temperature, s_humidity FROM temperature WHERE s_id=@id;",
        substitutionValues: {'id': id},
      );
      await conn.close();

      if (results.isNotEmpty) {
        s_temperature = results[0][0].toString();
        s_humidity = results[0][1].toString();
        data = [s_temperature, s_humidity];
      } else {
        throw Exception('DATA not found for ID $id');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}

class Temp extends StatefulWidget {
  const Temp({super.key});

  static const routeName = '/temp';

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  late DataBase db;
  String sTemperature = "-1";
  String sHumidity = "-1";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    db = DataBase();
    _fetchData();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _fetchData();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchData() async {
    try {
      await db.connect();
      setState(() {
        sTemperature = db.s_temperature;
        sHumidity = db.s_humidity;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Control"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "🌡️ Temperature: ",
              style: TextStyle(fontSize: 30, color: Colors.black87),
            ),
            Text(
              sTemperature,
              style: const TextStyle(fontSize: 50, color: Colors.red),
            ),
            const SizedBox(height: 30,),
            const Text(
              "💧 Humidity: ",
              style: TextStyle(fontSize: 30, color: Colors.black87),
            ),
            Text(
              sHumidity,
              style: const TextStyle(fontSize: 50, color: Colors.blue),
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
    home: Temp(),
  ));
}
