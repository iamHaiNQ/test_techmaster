List<List<int>> solveNQueens(int n) {
  List<List<int>> solutions = [];
  List<int> board = List.filled(n, -1);

  bool isSafe(int row, int col) {
    for (int prevRow = 0; prevRow < row; prevRow++) {
      int prevCol = board[prevRow];
      if (prevCol == col ||
          (prevRow - prevCol) == (row - col) ||
          (prevRow + prevCol) == (row + col)) {
        return false;
      }
    }
    return true;
  }

  void solve(int row) {
    if (row == n) {
      solutions.add(List.from(board));
      return;
    }
    for (int col = 0; col < n; col++) {
      if (isSafe(row, col)) {
        board[row] = col;
        solve(row + 1);
        board[row] = -1;
      }
    }
  }

  solve(0);
  return solutions;
}
