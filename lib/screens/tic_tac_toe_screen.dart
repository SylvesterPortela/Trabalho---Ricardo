import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  State<TicTacToeScreen> createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<List<String>> _board = List.generate(3, (_) => List.filled(3, ''));
  bool _isXTurn = true;
  String _winner = '';

  void _resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.filled(3, ''));
      _isXTurn = true;
      _winner = '';
    });
  }

  void _makeMove(int row, int col) {
    if (_board[row][col].isNotEmpty || _winner.isNotEmpty) return;

    setState(() {
      _board[row][col] = _isXTurn ? 'X' : 'O';
      _isXTurn = !_isXTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // Verificar linhas
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] != '' &&
          _board[i][0] == _board[i][1] &&
          _board[i][1] == _board[i][2]) {
        _winner = _board[i][0];
        return;
      }
    }

    // Verificar colunas
    for (int i = 0; i < 3; i++) {
      if (_board[0][i] != '' &&
          _board[0][i] == _board[1][i] &&
          _board[1][i] == _board[2][i]) {
        _winner = _board[0][i];
        return;
      }
    }

    // Verificar diagonais
    if (_board[0][0] != '' &&
        _board[0][0] == _board[1][1] &&
        _board[1][1] == _board[2][2]) {
      _winner = _board[0][0];
      return;
    }

    if (_board[0][2] != '' &&
        _board[0][2] == _board[1][1] &&
        _board[1][1] == _board[2][0]) {
      _winner = _board[0][2];
      return;
    }

    // Verificar empate
    bool isBoardFull = _board.every((row) => row.every((cell) => cell.isNotEmpty));
    if (isBoardFull) {
      _winner = 'Empate';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _winner.isEmpty
                ? 'Vez do ${_isXTurn ? "X" : "O"}'
                : _winner == 'Empate'
                    ? 'Empate!'
                    : 'Vencedor: $_winner',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            3,
            (row) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (col) => GestureDetector(
                  onTap: () => _makeMove(row, col),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        _board[row][col],
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _resetGame,
            child: const Text('Reiniciar Jogo'),
          ),
        ],
      ),
    );
  }
} 