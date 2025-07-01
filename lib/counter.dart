import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveCounter(int value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('counter', value);
}

Future<int> loadCounter() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('counter') ?? 0;
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int localCounter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounterValue();
  }

  void _loadCounterValue() async {
    int loadedValue = await loadCounter();
    setState(() {
      localCounter = loadedValue;
    });
  }

  void _incrementCounter() {
    setState(() {
      localCounter++;
      saveCounter(localCounter);
    });
  }
  void _decrementCounter() {
    setState(() {
      localCounter--;
      saveCounter(localCounter);
    });
  }

  void _resetCounter() {
    setState(() {
      localCounter = 0;
      saveCounter(localCounter);
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Counting App'),
    ),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$localCounter ... and counting',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _decrementCounter,
                child: const Text('Decrement'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _resetCounter,
                child: const Text('Reset'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Increment'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

}