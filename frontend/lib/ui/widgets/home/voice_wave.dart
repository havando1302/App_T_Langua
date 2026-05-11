import 'package:flutter/material.dart';

class VoiceWave extends StatelessWidget {
  const VoiceWave({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: List.generate(20, (index) {
        double height = (index % 5 + 1) * 12;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),

          width: 4,
          height: height,

          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}
