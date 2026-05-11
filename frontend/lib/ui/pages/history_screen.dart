import 'package:flutter/material.dart';
import '../widgets/history/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        _buildHeader(context),

        // Danh sách lịch sử
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFC), // Màu nền xám cực nhạt giống ảnh
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.only(top: 25, bottom: 100),
              children: const [
                HistoryCard(
                  originalText: "Xin chào",
                  translatedText: "Hello",
                  time: "10:30",
                  fromFlag: "🇻🇳",
                  toFlag: "🇺🇸",
                  isFavorite: true,
                ),
                HistoryCard(
                  originalText: "Thank you",
                  translatedText: "Cảm ơn bạn",
                  time: "10:35",
                  fromFlag: "🇺🇸",
                  toFlag: "🇻🇳",
                  isFavorite: true,
                ),
                HistoryCard(
                  originalText: "Bạn khỏe không?",
                  translatedText: "How are you?",
                  time: "10:32",
                  fromFlag: "🇻🇳",
                  toFlag: "🇺🇸",
                ),
                HistoryCard(
                  originalText: "Tôi đang học tiếng Anh",
                  translatedText: "I am learning English",
                  time: "10:40",
                  fromFlag: "🇻🇳",
                  toFlag: "🇺🇸",
                ),
                HistoryCard(
                  originalText: "See you later",
                  translatedText: "Hẹn gặp lại bạn sau",
                  time: "11:00",
                  fromFlag: "🇺🇸",
                  toFlag: "🇻🇳",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {}, // Xử lý quay lại nếu cần
          ),
          const Text(
            "History",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
