import 'package:flutter/material.dart';

class DualMicBar extends StatefulWidget {
  const DualMicBar({super.key});

  @override
  State<DualMicBar> createState() => _DualMicBarState();
}

class _DualMicBarState extends State<DualMicBar> {
  int _activeMic = 0; // 1 cho Việt, 2 cho Anh

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMicButton(1, "Vietnamese", "🇻🇳", Colors.green),
          _buildMicButton(2, "English", "🇺🇸", Colors.indigo),
        ],
      ),
    );
  }

  Widget _buildMicButton(int id, String label, String flag, Color activeColor) {
    bool isActive = _activeMic == id;

    return GestureDetector(
      onLongPressStart: (_) =>
          setState(() => _activeMic = id), // Đổi màu khi nhấn giữ
      onLongPressEnd: (_) =>
          setState(() => _activeMic = 0), // Trở về bình thường
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: isActive ? activeColor : activeColor.withOpacity(0.7),
              shape: BoxShape.circle,
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: activeColor.withOpacity(0.4),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: const Icon(Icons.mic, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(flag, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF334155),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
