import 'package:flutter/material.dart';

class FuelCalculatorScreen extends StatefulWidget {
  const FuelCalculatorScreen({super.key});

  @override
  State<FuelCalculatorScreen> createState() => _FuelCalculatorScreenState();
}

class _FuelCalculatorScreenState extends State<FuelCalculatorScreen> {
  final _alcoholController = TextEditingController();
  final _gasolineController = TextEditingController();
  String _result = '';

  void _calculateBestFuel() {
    double alcoholPrice = double.tryParse(_alcoholController.text) ?? 0;
    double gasolinePrice = double.tryParse(_gasolineController.text) ?? 0;

    if (alcoholPrice <= 0 || gasolinePrice <= 0) {
      setState(() {
        _result = 'Digite valores válidos';
      });
      return;
    }

    double ratio = alcoholPrice / gasolinePrice;

    setState(() {
      _result = ratio <= 0.7
          ? 'Abasteça com Álcool'
          : 'Abasteça com Gasolina';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Combustível'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _alcoholController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço do Álcool',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _gasolineController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço da Gasolina',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBestFuel,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 