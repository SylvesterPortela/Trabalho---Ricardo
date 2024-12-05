import 'package:flutter/material.dart';
import 'fuel_calculator_screen.dart';
import 'daily_phrases_screen.dart';
import 'games_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FuelCalculatorScreen(),
                  ),
                );
              },
              child: const Text('Calculadora de Combustível'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DailyPhrasesScreen(),
                  ),
                );
              },
              child: const Text('Frases do Dia'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GamesScreen(),
                  ),
                );
              },
              child: const Text('Jogos'),
            ),
          ],
        ),
      ),
    );
  }
} 