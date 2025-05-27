import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {
  final List<int> queenPositions;

  const ChessBoard({super.key, required this.queenPositions});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Chọn chiều nhỏ nhất làm cạnh hình vuông
      final boardSize = constraints.maxWidth < constraints.maxHeight
          ? constraints.maxWidth
          : constraints.maxHeight;

      final cellSize = boardSize / 9; // 8 ô + 1 ô cho viền chữ

      return Center(
        child: SizedBox(
          width: cellSize * 9,
          height: cellSize * 9,
          child: Column(
            children: List.generate(9, (row) {
              return SizedBox(
                height: cellSize,
                child: Row(
                  children: List.generate(9, (col) {
                    if (row == 0 && col == 0) {
                      return SizedBox(width: cellSize, height: cellSize); // Góc trống
                    } else if (row == 0) {
                      // Cột đánh số 1–8
                      return SizedBox(
                        width: cellSize,
                        child: Center(
                          child: Text('${col}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      );
                    } else if (col == 0) {
                      // Hàng đánh chữ A–H
                      return SizedBox(
                        width: cellSize,
                        child: Center(
                          child: Text(String.fromCharCode(64 + row),
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      );
                    } else {
                      final r = row - 1;
                      final c = col - 1;
                      final isDark = (r + c) % 2 == 1;
                      final hasQueen = queenPositions[r] == c;

                      return SizedBox(
                        width: cellSize,
                        height: cellSize,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDark ? Colors.brown : Colors.white,
                            border: Border.all(color: Colors.black12),
                          ),
                          child: hasQueen
                              ? const Center(
                            child: Text('♛', style: TextStyle(fontSize: 35)),
                          )
                              : null,
                        ),
                      );
                    }
                  }),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
