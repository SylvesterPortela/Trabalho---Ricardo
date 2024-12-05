import 'package:flutter/material.dart';
import 'dart:math';

class HeadsTailsScreen extends StatefulWidget {
  const HeadsTailsScreen({super.key});

  @override
  State<HeadsTailsScreen> createState() => _HeadsTailsScreenState();
}

class _HeadsTailsScreenState extends State<HeadsTailsScreen> {
  bool _isAnimating = false;
  String _result = '';
  final Random _random = Random();

  void _playGame(String playerChoice) {
    if (_isAnimating) return;

    setState(() {
      _isAnimating = true;
      _result = '';
    });

    // Simula a animação com um delay
    Future.delayed(const Duration(seconds: 2), () {
      String computerChoice = _random.nextBool() ? 'Cara' : 'Coroa';

      setState(() {
        _isAnimating = false;
        _result = 'Resultado: $computerChoice\n' +
            (computerChoice.toLowerCase() == playerChoice.toLowerCase()
                ? 'Você venceu!'
                : 'Você perdeu!');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cara ou Coroa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isAnimating)
              const CircularProgressIndicator()
            else
              Text(
                _result,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _isAnimating ? null : () => _playGame('cara'),
                  child: const Text('Cara'),
                ),
                ElevatedButton(
                  onPressed: _isAnimating ? null : () => _playGame('coroa'),
                  child: const Text('Coroa'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 