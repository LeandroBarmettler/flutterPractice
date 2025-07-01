import 'package:flutter/material.dart';
import 'package:helloworld/counter.dart';
import 'package:helloworld/BMICalc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Counter Page'),
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Counter()),
            );
          },
        ),
        ElevatedButton(
              child: const Text('BMI Page'),
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BMICalc()),
            );
          },
        ),
        ]
        )
        ),
      );
    
  }
}
