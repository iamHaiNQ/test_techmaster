
## 🧩 Bài 1: Vẽ Bàn Cờ Vua và Đặt Quân Hậu

### 🎯 Mục tiêu
- Hiển thị một bàn cờ vua 8x8 ô (đen trắng xen kẽ).
- Đặt một quân hậu tại vị trí bất kỳ bằng cách gọi hàm `place_queen(int row, int column)`.

---

### 📸 Kết quả (Screenshot)

<img src="screenshots/board_with_queen.png" width="300" />

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
- Dùng List.generate để tạo lưới 8x8.
- Sử dụng điều kiện (row + col) % 2 == 1 để xen kẽ ô đen – trắng.
- Kiểm tra isQueen để hiển thị ký hiệu ♕

#### ✅ Hàm `place_queen(int row, int column)`:
- Hàm này gọi `setState()` để cập nhật vị trí quân hậu.
- Có thể gọi từ bất kỳ nơi nào (nút bấm, logic nào đó...).

---

### 🤖 Prompt đã dùng để hỏi AI:

```
Hãy giúp tôi tạo giao diện Flutter vẽ bàn cờ vua 8x8 với màu trắng và đen xen kẽ. Sau đó tôi muốn đặt một quân hậu ở vị trí bất kỳ bằng cách gọi place_queen(int row, int column). Quân hậu có thể dùng ký hiệu ♕ hoặc hình ảnh. Hãy viết một widget hoàn chỉnh với khả năng cập nhật vị trí quân hậu.
```

---

### 📁 Cấu trúc file chính

```bash
lib/
├── main.dart            # Giao diện chính hiển thị bàn cờ          # (Tùy chọn) ảnh quân hậu
├── chessboard.dart      # Widget bàn cờ vua
screenshots/
├── board_with_queen.png # Ảnh chụp kết quả
```

---
### 🧪 Demo giao diện
```bash
flutter run
```
#### Sau khi chạy:

- Bấm nút “🎲 Đặt quân hậu ngẫu nhiên” để thấy quân hậu nhảy tới một ô khác.
---