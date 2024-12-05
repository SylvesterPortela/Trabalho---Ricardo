import 'package:flutter/material.dart';
import 'dart:math';

class JokenpoScreen extends StatefulWidget {
  const JokenpoScreen({super.key});

  @override
  State<JokenpoScreen> createState() => _JokenpoScreenState();
}

class _JokenpoScreenState extends State<JokenpoScreen> {
  final List<String> _options = ['Pedra', 'Papel', 'Tesoura'];
  String _computerChoice = '';
  String _result = '';

  void _play(String playerChoice) {
    final random = Random();
    _computerChoice = _options[random.nextInt(_options.length)];

    if (playerChoice == _computerChoice) {
      _result = 'Empate!';
    } else if ((playerChoice == 'Pedra' && _computerChoice == 'Tesoura') ||
        (playerChoice == 'Papel' && _computerChoice == 'Pedra') ||
        (playerChoice == 'Tesoura' && _computerChoice == 'Papel')) {
      _result = 'Você Venceu!';
    } else {
      _result = 'Computador Venceu!';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokenpô'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Escolha do Computador: $_computerChoice',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _options
                  .map(
                    (option) => ElevatedButton(
                      onPressed: () => _play(option),
                      child: Text(option),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
