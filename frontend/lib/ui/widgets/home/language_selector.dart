import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  // Trạng thái ngôn ngữ
  bool isVietnameseFirst = true;

  void _swapLanguages() {
    setState(() {
      isVietnameseFirst = !isVietnameseFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Dữ liệu hiển thị dựa trên trạng thái
    final leftLang = isVietnameseFirst ? 'Vietnamese' : 'English';
    final leftFlag = isVietnameseFirst ? '🇻🇳' : '🇬🇧';
    final rightLang = isVietnameseFirst ? 'English' : 'Vietnamese';
    final rightFlag = isVietnameseFirst ? '🇬🇧' : '🇻🇳';

    return Row(
      children: [
        // Khối bên trái
        Expanded(child: _buildLanguageCard(leftFlag, leftLang)),

        const SizedBox(width: 12),

        // Nút chuyển đổi (Đã tinh chỉnh hiệu ứng bấm)
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _swapLanguages,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.swap_horiz, color: Colors.white),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Khối bên phải
        Expanded(child: _buildLanguageCard(rightFlag, rightLang)),
      ],
    );
  }

  // Hàm tạo thẻ ngôn ngữ dùng chung
  Widget _buildLanguageCard(String flag, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ), // Thêm viền nhẹ cho sang
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(flag, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
