## ♛ Bài 2: Thuật Toán 8 Quân Hậu – Flutter

### 🎯 Mục tiêu
- Giải bài toán 8 quân hậu bằng Dart: đặt 8 quân hậu lên bàn cờ 8x8 sao cho không quân nào chiếu quân nào.
- Hiển thị từng lời giải và cho phép người dùng quẹt trái/phải để xem từng lời giải.

---


### 📸 Kết quả (Screenshot)

https://github.com/user-attachments/assets/cf4c22c0-4674-483e-bc48-6efb60acb4d7

---

### 🚀 Cách chạy dự án

1. Clone repo hoặc mở thư mục dự án trong VS Code / Android Studio.
2. Chạy lệnh:
   ```bash
   flutter pub get
   flutter run
   ```

---

### 🧠 Cách giải quyết

#### ✅ Ý tưởng chính:

- Dùng thuật toán **Backtracking** để tìm tất cả các lời giải của bài toán 8 quân hậu.
- Mỗi lời giải là một danh sách 8 số, biểu diễn vị trí cột của quân hậu trên từng hàng.
  ```dart
  // Ví dụ: [0, 4, 7, 5, 2, 6, 1, 3] nghĩa là:
  // Hàng 0: cột 0, Hàng 1: cột 4, ...
  ```
- Dùng `PageView` để hiển thị từng lời giải và cho phép người dùng quẹt trái/phải để xem.

---

### 🤖 Prompt đã dùng để hỏi AI:

```
Viết chương trình Flutter/Dart giải bài toán 8 quân hậu bằng thuật toán quay lui (backtracking), tìm tất cả lời giải. Sau đó hiển thị từng lời giải lên bàn cờ 8x8 bằng GridView hoặc tương tự, dùng PageView để cho phép người dùng quét trái/phải giữa các lời giải.
```

---

### 📁 Cấu trúc file chính

```bash
lib/
├── main.dart              # Giao diện chính
├── widget_banco.dart      # Widget hiển thị bàn cờ với quân hậu
├── solve_queen.dart       # Thuật toán tìm lời giải
```

---


