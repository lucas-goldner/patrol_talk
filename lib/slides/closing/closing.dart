import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class ClosingSlide extends FlutterDeckSlideWidget {
  const ClosingSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/closing',
            title: '終わりに・質疑応答',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(64),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  '🙋‍♂️ ありがとうございました！',
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '始めるには：',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'flutter pub add --dev patrol',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.chat_bubble_outline,
                            size: 32,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Discordに参加してください：',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'https://patrol.leancode.dev/chat',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue[700],
                          decoration: TextDecoration.underline,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  '質問はありますか？最も困難なテストシナリオについてお話ししましょう！',
                  style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                ],
              ),
            ),
          ),
        ),
      );
}