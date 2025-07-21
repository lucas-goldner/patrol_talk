import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';

class ProfileBubble extends StatelessWidget {
  const ProfileBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade400,
                Colors.purple.shade400,
              ],
            ),
          ),
          child: const Icon(
            Icons.person,
            size: 50,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 20),
        GlassContainer(
          width: 600,
          height: 120,
          borderRadius: 15,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'こんにちは👋 Flutterアプリネイティブぽくなること好きな',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'アプリチームのルーカス ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  Text(
                    '(YOUTRUST / X)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue.shade200,
                      decoration: TextDecoration.underline,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
