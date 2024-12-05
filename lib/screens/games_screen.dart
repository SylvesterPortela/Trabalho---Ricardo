import 'package:flutter/material.dart';
import 'jokenpo_screen.dart';
import 'heads_tails_screen.dart';
import 'tic_tac_toe_screen.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogos'),
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
                    builder: (context) => const JokenpoScreen(),
                  ),
                );
              },
              child: const Text('Jokenpô'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HeadsTailsScreen(),
                  ),
                );
              },
              child: const Text('Cara ou Coroa'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TicTacToeScreen(),
                  ),
                );
              },
              child: const Text('Jogo da Velha'),
            ),
          ],
        ),
      ),
    );
  }
} 