import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class EnterPatrolSlide extends FlutterDeckSlideWidget {
  const EnterPatrolSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/enter-patrol',
            title: 'Patrol登場',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(64),
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
                  '✨ Patrol登場',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue.withValues(alpha: 0.3),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '🚨 Flutter第一のUIテストフレームワーク',
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
                          SvgPicture.asset(
                            'assets/images/leancode-logo.svg',
                            height: 50,
                          ),
                          const SizedBox(width: 30),
                          Image.asset(
                            'assets/images/patrol.webp',
                            height: 50,
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