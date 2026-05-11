import 'package:flutter/material.dart';
import 'translation_actions.dart';

class TranslateCard extends StatelessWidget {
  final String speechText;
  final String translatedText;
  final bool isListening;

  const TranslateCard({
    super.key,
    required this.speechText,
    required this.translatedText,
    this.isListening = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // --- KHỐI 1: THẺ CHỨA CHỮ (NỀN TRẮNG MỜ) ---
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08), // Màu nền mờ
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bạn nói',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 8),
              Text(
                speechText.isEmpty ? "..." : speechText,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(color: Colors.white12),
              ),
              const Text(
                'Translation',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 8),
              Text(
                translatedText.isEmpty ? "..." : translatedText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // KHOẢNG CÁCH GIỮA THẺ VÀ NÚT
        if (translatedText.isEmpty) const SizedBox(height: 16),

        // --- KHỐI 2: CÁC NÚT HÀNH ĐỘNG (NẰM NGOÀI CÁI NỀN MỜ) ---
        if (translatedText.isEmpty)
          const TranslationActions(), // Widget con bạn đã tạo
      ],
    );
  }
}
