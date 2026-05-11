import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Để dùng tính năng rung nhẹ hoặc Copy

class TranslationActions extends StatelessWidget {
  const TranslationActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            icon: Icons.volume_up_rounded,
            label: 'Play',
            iconColor: Colors.blue,
            onTap: () {
              // Logic phát âm thanh ở đây
              print("Đang phát...");
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            icon: Icons.copy_rounded,
            label: 'Copy',
            iconColor: Colors.indigo,
            onTap: () {
              // Thêm hiệu ứng rung nhẹ khi copy
              HapticFeedback.lightImpact();
              print("Đã copy!");
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            icon: Icons.star_rounded,
            label: 'Save',
            iconColor: Colors.amber,
            onTap: () {
              print("Đã lưu!");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white, // Nền trắng
      borderRadius: BorderRadius.circular(16),
      elevation: 2, // Tạo độ nổi nhẹ
      shadowColor: Colors.black26,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: iconColor.withOpacity(0.1), // Màu gợn sóng khi nhấn
        highlightColor: iconColor.withOpacity(0.05), // Màu khi giữ tay vào
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF334155),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
