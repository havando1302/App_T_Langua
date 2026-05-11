import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String originalText;
  final String translatedText;
  final String time;
  final bool isFavorite;
  final String fromFlag;
  final String toFlag;

  const HistoryCard({
    super.key,
    required this.originalText,
    required this.translatedText,
    required this.time,
    required this.fromFlag,
    required this.toFlag,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Dấu sao tím góc trên bên trái nếu là Favorite
          if (isFavorite)
            Positioned(
              left: -5,
              top: -5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF6366F1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.star, color: Colors.white, size: 12),
              ),
            ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Câu gốc
              Row(
                children: [
                  Text(fromFlag, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      originalText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ),
                  // Nút Action (Star & Trash)
                  Icon(
                    isFavorite
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: isFavorite ? const Color(0xFF6366F1) : Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.redAccent,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Câu dịch
              Row(
                children: [
                  Text(toFlag, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      translatedText,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Thời gian
              Text(
                time,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
