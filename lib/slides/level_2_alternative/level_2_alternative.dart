import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/slides/level_2_alternative/widgets/choyan_shader_widget.dart';

class Level2AlternativeSlide extends FlutterDeckSlideWidget {
  const Level2AlternativeSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/level-2-alternative',
            title: 'Level 2 別のシンプルなLiquid Glass実装',
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
                  'Level 2: 別のシンプルなLiquid Glass実装',
                  style: TextStyle(
                    fontSize: 58,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 40),
                GlassContainer(
                  width: 800,
                  height: 250,
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ちゅーやんさんの実装',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '別のShadertoyサンプルベースで作成',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.link,
                            color: Colors.blue.shade200,
                            size: 24,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '@chooyan_i18n',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.blue.shade200,
                              decoration: TextDecoration.underline,
                              fontFamily:
                                  GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const ChoyanShaderWidget(),
              ],
            ),
          ),
        ),
      );
}
