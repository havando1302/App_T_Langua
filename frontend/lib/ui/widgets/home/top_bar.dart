import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final VoidCallback onHistoryPressed; // Thêm dòng này

  const TopBar({
    super.key,
    required this.onHistoryPressed,
  }); // Thêm vào constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ), // Tinh chỉnh cho gọn
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(
          0.05,
        ), // Đổi sang màu mờ cho đồng bộ app
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onHistoryPressed, // Gọi lệnh khi nhấn
            icon: const Icon(Icons.history_rounded, color: Colors.white70),
          ),
          const Text(
            "Voice Translator",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          IconButton(
            onPressed: () {}, // Có thể làm tương tự cho Settings
            icon: const Icon(Icons.settings_outlined, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
