import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class ImplementationOverviewSlide extends FlutterDeckSlideWidget {
  const ImplementationOverviewSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/implementation-overview',
            title: 'FlutterでLiquid Glassの実装',
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
                  'FlutterでLiquid Glassの実装',
                  style: TextStyle(
                    fontSize: 58,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 40),
                GlassContainer(
                  width: 900,
                  height: 200,
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Flutterチームは対応予定なし',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'でも、ダイアログ部分だけでも対応したい！🎯',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                GlassContainer(
                  width: 700,
                  height: 100,
                  padding: const EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                      '独自に実装を行いました 💪',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
