class ChatMessage {
  final String text; // Nội dung câu gốc (ví dụ: "Xin chào")
  final String translation; // Nội dung đã dịch (ví dụ: "Hello")
  final bool isMe; // Để phân biệt bên trái hay bên phải

  ChatMessage({
    required this.text,
    required this.translation,
    required this.isMe,
  });
}
