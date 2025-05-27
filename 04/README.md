## ♛ Bài 4: Minh họa thuật toán Selection Sort

### 🎯 Mục tiêu
- Viết thuật toán Selection Sort bằng **ngôn ngữ C**.
- Giao diện và hiển thị kết quả bằng **Flutter/Dart**.
- Dùng kỹ thuật **FFI (Foreign Function Interface)** để gọi hàm C từ Dart.

---

### 📸 Kết quả (Screenshot)

https://github.com/user-attachments/assets/c0aae10c-cea1-4bdf-8080-43a33f09052c

<img src="https://github.com/user-attachments/assets/9079cb20-296d-436a-818e-e0d51d923c03" width="200" />


---



#### ✅ Ý tưởng chính:

- Viết hàm `selectionSort()` bằng C, lưu tất cả lời giải vào mảng hai chiều.
- Biên dịch thành thư viện động `.so` (trên Linux/Android), `.dll` (Windows), hoặc `.dylib` (macOS).
- Dùng `dart:ffi` để khai báo và gọi hàm từ Flutter.
---

### 🤖 Prompt đã dùng để hỏi AI:

```
Hãy viết một thuật toán C selection sort. Sau đó hướng dẫn tôi cách dùng Flutter/Dart với FFI để gọi đến thư viện C này và hiển thị các cột sắp xếp animation , các bước so sánh , số lần truy cập mảng , màu cột vừa dược đổi chỗ thì là màu xanh, các cột đang được so sánh là màu đỏ.
```

---

### 📁 Cấu trúc file chính

```bash
lib/
├── main.dart             # Flutter app entry point
├── selection_sort_ffi.dart       # Dart FFI binding to C code
└── widget_sort.dart      # UI to render chess board from solution
android/
└── app/src/main/cpp/
    ├── selection_sort.c   
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
