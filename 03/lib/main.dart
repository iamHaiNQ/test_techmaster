import 'package:flutter/material.dart';
import 'package:test_03/widget_board.dart';

import 'ffi_queens.dart';

void main() {
  runApp(const QueensApp());
}

class QueensApp extends StatelessWidget {
  const QueensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '8 Queens Solutions',
      home: QueensPage(),
    );
  }
}
class QueensPage extends StatelessWidget {
  final List<List<int>> solutions = getQueensSolutions(limit: 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("8 Queens from C")),
      body: PageView.builder(
        itemCount: solutions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(child: ChessBoard(queenPositions: solutions[index])),
              Text("Solution ${index + 1} of ${solutions.length}",)
            ],
          );
        },
      ),
    );
  }
}