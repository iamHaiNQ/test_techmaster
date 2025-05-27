import 'dart:math';
import 'package:flutter/material.dart';

import 'chessboard.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: ChessDemo())));
}

class ChessDemo extends StatelessWidget {
  const ChessDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final boardKey = GlobalKey<ChessBoardWidgetState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChessBoardWidget(key: boardKey),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final random = Random();
              int row = random.nextInt(8);
              int col = random.nextInt(8);
              boardKey.currentState?.placeQueen(row, col);
            },
            child: const Text('🎲 Đặt quân hậu ngẫu nhiên'),
          ),
        ],
      ),
    );
  }
}