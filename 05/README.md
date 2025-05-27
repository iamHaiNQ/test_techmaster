
## Bài 5: 📐 Tam Giác Tương Tác - Flutter App

### 🎯 Mục tiêu
- Ứng dụng Flutter cho phép người dùng vẽ và tương tác với tam giác bằng cách chạm và kéo các đỉnh.

---
## 🎯 Tính năng

- Hiển thị một tam giác với ba đỉnh mặc định.
- Cho phép người dùng chạm vào từng đỉnh để kéo và di chuyển.
- Tam giác được vẽ lại tự động sau mỗi thao tác kéo.
- Giao diện sử dụng `CustomPainter` để render tam giác và đỉnh.

---
### 📸 Kết quả (Screenshot)

| Trước khi kéo | Sau khi kéo |
|---------------|-------------|
| <img src="https://github.com/user-attachments/assets/edcc145a-07ce-4d15-b4c9-ec09da0d5a49" width="200" />| <img src="https://github.com/user-attachments/assets/01ca29be-1d12-4bdf-98ce-26a3a66931a2" width="200" /> |

---

### 🚀 Cách chạy dự án

1. Clone repo hoặc mở thư mục dự án trong VS Code / Android Studio.
2. Chạy lệnh:
   ```bash
   flutter pub get
   flutter run
   ```

---

✅ Giải pháp:
- Sử dụng GestureDetector để:

- onPanStart: xác định người dùng đang chạm gần đỉnh nào.

- onPanUpdate: cập nhật vị trí của đỉnh khi kéo.

- onPanEnd: bỏ chọn đỉnh sau khi thả tay.

- Sử dụng CustomPaint và Canvas để:

- Vẽ đường tam giác nối 3 đỉnh.

- Vẽ các chấm tròn nhỏ tại mỗi đỉnh để dễ thao tác.

- Giới hạn vùng chạm bằng bán kính touchRadius để phát hiện va chạm với đỉnh gần nhất.

### 🤖 Prompt đã dùng để hỏi AI:

```
lập trình xử lý đa chạm để vẽ tam giác 3 cạnh , người dùng có thể chạm từng đỉnh để di chuyển vẽ lại tam giác bằng flutter
```

---

### 📁 Cấu trúc file chính

```bash
lib/
├── main.dart              # Giao diện chính
```


