import 'package:flutter/material.dart';
import '/models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: message.isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: BoxDecoration(
              // Màu sắc theo ảnh: Tím cho người dùng (Me), Xám nhạt cho đối phương
              color: message.isMe
                  ? const Color(0xFF6366F1)
                  : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(22).copyWith(
                bottomRight: message.isMe
                    ? const Radius.circular(4)
                    : const Radius.circular(22),
                bottomLeft: message.isMe
                    ? const Radius.circular(22)
                    : const Radius.circular(4),
              ),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.isMe ? Colors.white : const Color(0xFF1E293B),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 6),
          // Phần văn bản dịch nhỏ mờ bên dưới
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              message.translation,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
