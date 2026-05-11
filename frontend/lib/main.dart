import 'package:flutter/material.dart';
import 'ui/pages/home_page.dart'; // Đảm bảo đường dẫn này đúng với thư mục của bạn

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tắt chữ DEBUG ở góc phải
      debugShowCheckedModeBanner: false,

      title: 'Voice Translator App',

      // Cấu hình Theme (Màu sắc chủ đạo)
      theme: ThemeData(
        useMaterial3: true,
        // Chế độ tối cho phù hợp với nền xanh đen 0xFF0F172A của bạn
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(
          0xFF0F172A,
        ), // Màu nền mặc định toàn app
      ),

      // Trang đầu tiên app hiện ra khi mở
      home: const HomePage(),
    );
  }
}
