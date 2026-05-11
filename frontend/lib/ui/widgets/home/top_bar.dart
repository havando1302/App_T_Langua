import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  // 1. Khai báo thêm callback cho Settings
  final VoidCallback onHistoryPressed;
  final VoidCallback onSettingsPressed;

  const TopBar({
    super.key,
    required this.onHistoryPressed,
    required this.onSettingsPressed, // 2. Yêu cầu truyền vào khi gọi TopBar
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Nút Lịch sử (History)
          IconButton(
            onPressed: onHistoryPressed,
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

          // 3. Nút Cài đặt (Settings) - Đã fix để gọi hàm truyền từ HomePage
          IconButton(
            onPressed: onSettingsPressed,
            icon: const Icon(Icons.settings_outlined, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
