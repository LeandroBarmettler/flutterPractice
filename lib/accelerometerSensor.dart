import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerPage extends StatefulWidget {
  const AccelerometerPage({super.key});

  @override
  State<AccelerometerPage> createState() => _AccelerometerPageState();
}

class _AccelerometerPageState extends State<AccelerometerPage> {
  // Subscription to accelerometer events
  StreamSubscription<AccelerometerEvent>? _sensorSubscription;
  final List<AccelerometerEvent> _events = [];

  @override
  void initState() {
    super.initState();

    // Listen to accelerometer events with normal sampling rate
    _sensorSubscription = accelerometerEvents.listen((event) {
      setState(() {
        _events.add(event);
        if (_events.length > 20) {
          _events.removeAt(0);
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel subscription when widget is disposed to avoid memory leaks
    _sensorSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accelerometer Page'),
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (context, index) {
          final e = _events[index];
          return ListTile(
            title: Text('x: ${e.x.toStringAsFixed(2)}, y: ${e.y.toStringAsFixed(2)}, z: ${e.z.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
