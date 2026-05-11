import 'package:flutter/material.dart';
import '/models/chat_message.dart';
import '../widgets/chat/chat_bubble.dart';
import '../widgets/chat/dual_mic_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Dữ liệu mẫu để hiển thị
  final List<ChatMessage> _messages = [
    ChatMessage(text: "Xin chào", translation: "Hello", isMe: false),
    ChatMessage(
      text: "How are you?",
      translation: "Bạn khỏe không?",
      isMe: true,
    ),
    ChatMessage(
      text: "Tôi khỏe, cảm ơn bạn",
      translation: "I'm fine, thank you",
      isMe: false,
    ),
    ChatMessage(
      text: "Nice to meet you",
      translation: "Rất vui được gặp bạn",
      isMe: true,
    ),
    ChatMessage(
      text: "Where are you from?",
      translation: "Bạn từ đâu tới?",
      isMe: true,
    ),
    ChatMessage(
      text: "Tôi đến từ Việt Nam",
      translation: "I am from Vietnam",
      isMe: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Header của trang Chat (Tùy chỉnh lại cho hợp nền tối)
        _buildHeader(),

        // 2. Danh sách tin nhắn (Cuộn vô tận)
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color:
                  Colors.white, // Giữ nền trắng cho khu vực chat giống ảnh mẫu
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(message: _messages[index]);
                },
              ),
            ),
          ),
        ),

        // 3. Thanh điều khiển Mic (Nằm dưới cùng)
        const DualMicBar(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              // Vì nằm trong BottomBar nên nút này thường dùng để quay về tab đầu tiên
              // Hoặc bạn có thể bỏ đi nếu không cần
            },
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Conversation",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Vietnamese ↔ English",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
