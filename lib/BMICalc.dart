import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BMICalc extends StatefulWidget {
  const BMICalc({super.key});

  @override
  State<BMICalc> createState() => _BMIState();
}

Future<void> saveBMI(double value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('BMI', value);
}

Future<double> loadBMI() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble('BMI') ?? 0;
}

class _BMIState extends State<BMICalc> {
  double BMI_value = 0.0;

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadBMIValue();
  }

  void _loadBMIValue() async {
    double loadedValue = await loadBMI();
    setState(() {
      BMI_value = loadedValue;
    });
  }

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      setState(() {
        BMI_value = weight / ((height) * (height));
        saveBMI(BMI_value);
      });
    } else {
      setState(() {
        BMI_value = 0.0;
      });
    }
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('BMI Calculator'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _heightController,
            key: const Key('heightField'),
            decoration: const InputDecoration(
              labelText: 'Height in m',
              border: OutlineInputBorder(),
            ),
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _weightController,
            key: const Key('weightField'),
            decoration: const InputDecoration(
              labelText: 'Weight in Kg',
              border: OutlineInputBorder(),
            ),
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _calculateBMI,
            child: const Text('Calculate BMI'),
          ),
          const SizedBox(height: 24),
          Text(
            'BMI: ${BMI_value.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),

  );
}

}