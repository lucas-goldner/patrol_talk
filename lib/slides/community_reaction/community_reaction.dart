import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/generated/assets.gen.dart';

class CommunityReactionSlide extends FlutterDeckSlideWidget {
  const CommunityReactionSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/community-reaction',
            title: 'Flutter界隈に激震が走った！',
            steps: 7,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => FlutterDeckSlideStepsBuilder(
          builder: (context, stepNumber) => SlideWithMesh(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (stepNumber == 1)
                    GlassContainer(
                      width: 1000,
                      height: 400,
                      child: Assets.images.issue.image(
                        width: 1000,
                        height: 400,
                      ),
                    ),
                  if (stepNumber >= 2)
                    Text(
                      'Flutter界隈に激震が走った！😲',
                      style: TextStyle(
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                  if (stepNumber >= 3) ...[
                    const SizedBox(height: 30),
                    AnimatedOpacity(
                      opacity: stepNumber >= 3 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 600),
                      child: GlassContainer(
                        width: 900,
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            'コメント欄では、まるで戦場のような熱い議論が繰り広げられました🔥💬',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black87,
                              fontFamily:
                                  GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (stepNumber >= 4) ...[
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: stepNumber >= 4 ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          child: _buildPointCard(
                            '難易度とメンテナンス負荷⚙️',
                            'Liquid Glassを取り込むのは技術的に高難度',
                          ),
                        ),
                        const SizedBox(width: 20),
                        AnimatedOpacity(
                          opacity: stepNumber >= 5 ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          child: _buildPointCard(
                            '既存ウィジェットの限界📏',
                            'CupertinoWidgetsは最新UIに追随できない',
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (stepNumber >= 6) ...[
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: stepNumber >= 6 ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          child: _buildPointCard(
                            '独立パッケージ化の提案📦',
                            'まずは独立パッケージとして試験的に提供すべき',
                          ),
                        ),
                        const SizedBox(width: 20),
                        AnimatedOpacity(
                          opacity: stepNumber >= 7 ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          child: _buildPointCard(
                            'Flutter強みへの回帰💡',
                            '独特な一貫したUIレンダリング',
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildPointCard(String title, String content) {
    return GlassContainer(
      width: 420,
      height: 220,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
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
