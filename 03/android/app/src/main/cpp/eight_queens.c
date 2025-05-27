#include <stdlib.h>

int isSafe(int row, int col, int* board) {
    for (int i = 0; i < row; i++) {
        if (board[i] == col || abs(board[i] - col) == abs(i - row)) return 0;
    }
    return 1;
}

int solve(int row, int* board, int* output, int* count, int limit) {
    if (*count >= limit) return 1;

    if (row == 8) {
        for (int i = 0; i < 8; i++) {
            output[*count * 8 + i] = board[i];
        }
        (*count)++;
        return 0;
    }

    for (int col = 0; col < 8; col++) {
        if (isSafe(row, col, board)) {
            board[row] = col;
            if (solve(row + 1, board, output, count, limit)) return 1;
        }
    }
    return 0;
}

void solve_8_queens(int* output, int limit) {
    int board[8];
    int count = 0;
    solve(0, board, output, &count, limit);
}
