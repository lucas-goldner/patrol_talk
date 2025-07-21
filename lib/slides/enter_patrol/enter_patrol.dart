import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class EnterPatrolSlide extends FlutterDeckSlideWidget {
  const EnterPatrolSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/enter-patrol',
            title: 'Enter Patrol',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 120,
                  color: Colors.orange,
                ),
                const SizedBox(height: 40),
                Text(
                  '✨ Enter Patrol',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 30),
                GlassContainer(
                  width: 800,
                  height: 200,
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '🚨 The Flutter-first UI testing framework',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.business,
                            size: 32,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'by LeanCode',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.blue[700],
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}