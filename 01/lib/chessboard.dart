import 'package:flutter/material.dart';

class ChessBoardWidget extends StatefulWidget {
  const ChessBoardWidget({super.key});

  @override
  State<ChessBoardWidget> createState() => ChessBoardWidgetState();
}

class ChessBoardWidgetState extends State<ChessBoardWidget> {
  int? queenRow;
  int? queenCol;

  void placeQueen(int row, int column) {
    setState(() {
      queenRow = row;
      queenCol = column;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double cellSize = 40;
    const List<String> columnLabels = ['A','B','C','D','E','F','G','H'];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Column labels (A-H)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: cellSize), // corner empty
            ...columnLabels.map((label) => SizedBox(
              width: cellSize,
              height: cellSize / 2,
              child: Center(child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
            )),
          ],
        ),
        // Board rows
        ...List.generate(8, (row) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row label (8 to 1)
              SizedBox(
                width: cellSize,
                height: cellSize,
                child: Center(child: Text('${8 - row}', style: const TextStyle(fontWeight: FontWeight.bold))),
              ),
              ...List.generate(8, (col) {
                bool isBlack = (row + col) % 2 == 1;
                bool isQueen = queenRow == row && queenCol == col;
                return Container(
                  width: cellSize,
                  height: cellSize,
                  color: isBlack ? Colors.brown : Colors.white,
                  child: Center(
                    child: isQueen
                        ? const Text(
                      '♕',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    )
                        : null,
                  ),
                );
              }),
            ],
          );
        }),
      ],
    );
  }
}
