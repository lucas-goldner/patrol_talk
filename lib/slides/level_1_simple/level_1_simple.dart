import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/slides/level_1_simple/widgets/liquid_glass_lucas.dart';

class Level1SimpleSlide extends FlutterDeckSlideWidget {
  const Level1SimpleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/level-1-simple',
            title: 'Level 1 シンプルなLiquid Glass実装',
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
                  'Level 1: シンプルなLiquid Glass実装',
                  style: TextStyle(
                    fontSize: 58,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCard(
                      'シェーダー活用🧙‍♂️',
                      '画面上のオブジェクト描画時に\n陰影や質感、色を計算',
                    ),
                    const SizedBox(width: 30),
                    _buildCard(
                      'AI活用🤖',
                      'シェーダーの効率的な生成',
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GlassContainer(
                  width: 800,
                  height: 200,
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Shadertoyのサンプルを参考に実装',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.code,
                            color: Colors.blue.shade800,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'github.com/lucas-goldner/liquid_glass_example',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.blue.shade800,
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
                const DraggableLiquidGlass(),
              ],
            ),
          ),
        ),
      );

  Widget _buildCard(String title, String content) {
    return GlassContainer(
      width: 350,
      height: 300,
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
