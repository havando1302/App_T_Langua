import 'package:flutter/material.dart';

// Widgets
import '../widgets/home/top_bar.dart';
import '../widgets/home/language_selector.dart';
import '../widgets/home/voice_wave.dart';
import '../widgets/home/mic_button.dart';
import '../widgets/home/translate_card.dart';

// Screens
import 'chat_screen.dart';
import 'history_screen.dart';
import 'setting_screen.dart'; // Đảm bảo tên file là setting_screen.dart hoặc settings_screen.dart

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

  // 2. Quản lý điều hướng tab
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Danh sách các màn hình chính
    final List<Widget> pages = [
      _buildHomeContent(), // Index 0
      const ChatScreen(), // Index 1
      const HistoryScreen(), // Index 2
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        // Giữ trạng thái các tab khi chuyển đổi
        child: IndexedStack(index: _selectedIndex, children: pages),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // --- NỘI DUNG TRANG CHỦ (INDEX 0) ---
  Widget _buildHomeContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // TopBar với 2 hành động: Chuyển tab History và Mở trang Settings
          TopBar(
            onHistoryPressed: () {
              setState(() {
                _selectedIndex =
                    2; // Chuyển sang Tab History (vị trí số 3 trên bar)
              });
            },
            onSettingsPressed: () {
              // Mở trang Settings đè lên trên (có nút quay lại)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),

          const SizedBox(height: 20),
          const LanguageSelector(),

          const Spacer(),

          const VoiceWave(),
          const SizedBox(height: 30),

          const MicButton(),

          const SizedBox(height: 40),

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
      margin: const Offset(0, -10).distance > 0
          ? const EdgeInsets.only(left: 40, right: 40, bottom: 25)
          : const EdgeInsets.only(left: 40, right: 40, bottom: 25),
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
