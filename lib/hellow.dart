import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  print('Hello, World!');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World App'),
        ),
        body: const Center(
          child: Text('Hello, World!!'),
        ),
      ),
    );
  }
}