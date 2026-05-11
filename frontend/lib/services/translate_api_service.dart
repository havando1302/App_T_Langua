// gọi backend Python
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> translate() async {
    // 👉 MOCK API (fake delay giống call thật)
    await Future.delayed(const Duration(seconds: 2));

    return {
      "text_vi": "Tôi đang học AI",
      "text_en": "I am learning AI",
      "audio_path": "demo.mp3",
    };
  }
}
