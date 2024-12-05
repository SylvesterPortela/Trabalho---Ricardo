import 'package:flutter/material.dart';
import 'dart:math';
import '../utils/phrases.dart';

class DailyPhrasesScreen extends StatefulWidget {
  const DailyPhrasesScreen({super.key});

  @override
  State<DailyPhrasesScreen> createState() => _DailyPhrasesScreenState();
}

class _DailyPhrasesScreenState extends State<DailyPhrasesScreen> {
  String _currentPhrase = '';

  void _generateNewPhrase() {
    final random = Random();
    setState(() {
      _currentPhrase = Phrases.dailyPhrases[
          random.nextInt(Phrases.dailyPhrases.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases do Dia'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentPhrase,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateNewPhrase,
                child: const Text('Gerar Nova Frase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 