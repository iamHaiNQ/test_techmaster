## ♛ Bài 3: Giải 8 Quân Hậu bằng C – Giao Diện Flutter (FFI)

### 🎯 Mục tiêu
- Viết thuật toán giải bài toán 8 quân hậu bằng **ngôn ngữ C**.
- Giao diện và hiển thị kết quả bằng **Flutter/Dart**.
- Dùng kỹ thuật **FFI (Foreign Function Interface)** để gọi hàm C từ Dart.
- Cho phép người dùng quẹt trái/phải để xem từng lời giải trên giao diện Flutter.

---

### 📸 Kết quả (Screenshot)

<img src="https://github.com/user-attachments/assets/efda1d0a-73e5-4576-b538-09e034e0ef3d" width ="300" />


https://github.com/user-attachments/assets/87b09591-10cf-40cf-8334-f596ee49f64e

---


### 🧠 Cách giải quyết

- Tìm hiểu thuật toán 8 quân hậu
- Tìm hiểu về FFI

#### ✅ Ý tưởng chính:

- Viết hàm `solve_queens()` bằng C, lưu tất cả lời giải vào mảng hai chiều.
- Biên dịch thành thư viện động `.so` (trên Linux/Android), `.dll` (Windows), hoặc `.dylib` (macOS).
- Dùng `dart:ffi` để khai báo và gọi hàm từ Flutter.
- Dùng `PageView` để hiển thị từng lời giải, người dùng có thể vuốt trái/phải để chuyển.

---

### 🤖 Prompt đã dùng để hỏi AI:

```
Hãy viết một hàm C giải bài toán 8 quân hậu và trả về tất cả lời giải (tối đa 92 lời giải). Sau đó hướng dẫn tôi cách dùng Flutter/Dart với FFI để gọi đến thư viện C này và hiển thị lời giải dưới dạng bàn cờ với quân hậu. Mỗi lời giải là một trang trong PageView.
```

---

### 📁 Cấu trúc file chính

```bash
lib/
├── main.dart             # Flutter app entry point
├── ffi_queens.dart       # Dart FFI binding to C code
└── chess_board.dart      # UI to render chess board from solution
android/
└── app/src/main/cpp/
    ├── eight_queens.c    # C source code solving the 8 queens problem
    └── CMakeLists.txt    # Build config for native C code
```

---
### ✅ Requirements

- Flutter SDK
- Android NDK
- Dart FFI
- CMake >= 3.4

### 🧪 Tested Platforms
- ✅ Android (via .so)
- ❌ iOS (needs equivalent .framework and configuration)
- ❌ Windows/macOS/Linux: Supported with changes to dynamic library path
