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
            title: 'Closing & Q&A',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🙋‍♂️ Thank You!',
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 40),
                GlassContainer(
                  width: 800,
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Text(
                        'To get started:',
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
                            'Join us on Discord:',
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
                  'Questions? Let\'s talk about your toughest test scenarios!',
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
      );
}