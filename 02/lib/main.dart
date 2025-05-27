import 'package:flutter/material.dart';
import 'package:test_02/solve_queen.dart';
import 'package:test_02/widget_banco.dart';

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
  final List<List<int>> solutions = solveNQueens(8);

  QueensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("8 Queens Solutions")),
      body: PageView.builder(
        itemCount: solutions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(child: ChessBoard(queenPositions: solutions[index])),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Solution ${index + 1} of ${solutions.length}"),
              )
            ],
          );
        },
      ),
    );
  }
}
