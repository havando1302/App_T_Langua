import 'package:flutter/material.dart';

// Import các widget của bạn (đảm bảo đường dẫn đúng với dự án)
import '../widgets/home/top_bar.dart';
import '../widgets/home/language_selector.dart';
import '../widgets/home/voice_wave.dart';
import '../widgets/home/mic_button.dart';
import '../widgets/home/translate_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. Quản lý dữ liệu dịch thuật
  String speechText = "";
  String translatedText = "";
  bool isListening = false;

  // 2. Quản lý điều hướng trang
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Danh sách các màn hình để chuyển đổi
    final List<Widget> pages = [
      _buildHomeContent(), // Trang chủ (Index 0)
      const Center(
        child: Text("Chat Screen", style: TextStyle(color: Colors.white)),
      ), // (Index 1)
      const Center(
        child: Text("History Screen", style: TextStyle(color: Colors.white)),
      ), // (Index 2)
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: pages[_selectedIndex], // Hiển thị trang dựa trên index được chọn
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // --- NỘI DUNG CHÍNH CỦA TRANG TRANSLATE ---
  // Trong file home_page.dart, tại phần build của _buildHomeContent

  Widget _buildHomeContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // TRUYỀN LỆNH CHUYỂN SANG INDEX 2 (Trang History)
          TopBar(
            onHistoryPressed: () {
              setState(() {
                _selectedIndex =
                    2; // Số 2 tương ứng với vị trí History trong BottomBar
              });
            },
          ),

          const SizedBox(height: 20),
          const LanguageSelector(),

          // ... các phần còn lại giữ nguyên
          const Spacer(),

          const VoiceWave(),
          const SizedBox(height: 30),

          // Nút Mic (Nên thêm Callback ở đây để cập nhật speechText)
          const MicButton(),

          const SizedBox(height: 40),

          // Card dịch thuật (Dữ liệu truyền từ HomePage xuống)
          TranslateCard(
            speechText: speechText,
            translatedText: translatedText,
            isListening: isListening,
          ),

          const Spacer(),
        ],
      ),
    );
  }

  // --- THANH ĐIỀU HƯỚNG DƯỚI CÙNG ---
  Widget _buildBottomBar() {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, bottom: 25),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.white38,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded, size: 26),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded, size: 24),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded, size: 26),
              label: 'History',
            ),
          ],
        ),
      ),
    );
  }
}
