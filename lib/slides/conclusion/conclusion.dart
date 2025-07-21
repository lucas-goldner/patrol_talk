import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/generated/assets.gen.dart';

class ConclusionSlide extends FlutterDeckSlideWidget {
  const ConclusionSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/conclusion',
            title: '〆',
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
                  '〆',
                  style: TextStyle(
                    fontSize: 88,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 40),
                GlassContainer(
                  width: 800,
                  height: 600,
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Flutterでも自分らしい',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      Text(
                        'Liquid Glass🫧体験を追求し、',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      Text(
                        '開発を楽しみましょう！🎉',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'ユーザーにとって心地よく、自然に感じられる体験🌿',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Assets.images.youtrust.image(
                                width: 80,
                                height: 80,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'YOUTRUSTではエンジニアを募集中！✨',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontFamily:
                                      GoogleFonts.ibmPlexSansJp().fontFamily,
                                ),
                              ),
                            ],
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
