import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/slides/level_80_super_advanced/widgets/draggable_liquido_widget.dart';

class Level80SuperAdvancedSlide extends FlutterDeckSlideWidget {
  const Level80SuperAdvancedSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/level-80-super-advanced',
            title: 'Level 80 超先進なLiquid Glass実装',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Level 80: 超先進なLiquid Glass実装',
                      style: TextStyle(
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'by Renanさん (@reNotANumber)',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.blue.shade800,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 30),
                    GlassContainer(
                      width: 900,
                      height: 500,
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildTechPoint(
                            '専用のGlassRenderObjectWidget🧱',
                            'MultiChildRenderObjectWidget継承、2つの子ウィジェット',
                          ),
                          const SizedBox(height: 15),
                          _buildTechPoint(
                            '細かいパラメーター制御⚙️',
                            'blurSigma, saturationBoost, centerScale等',
                          ),
                          const SizedBox(height: 15),
                          _buildTechPoint(
                            '2パスレンダリング🔄',
                            'マスク部分レンダリング → シェーダー処理適用',
                          ),
                          const SizedBox(height: 15),
                          _buildTechPoint(
                            'パフォーマンス配慮🚀',
                            'キャッシュ利用、メモリリーク防止、最適化',
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.code,
                                color: Colors.green.shade50,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Liquido - ドラッグ可能デモ',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.green.shade50,
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
                  ],
                ),
              ),
              // Draggable Liquido widgets
              const DraggableLiquidoWidget(
                width: 180,
                height: 180,
                initialPosition: Offset(120, 280),
              ),
              const DraggableLiquidoWidget(
                width: 160,
                height: 160,
                initialPosition: Offset(750, 180),
              ),
              const DraggableLiquidoWidget(
                width: 140,
                height: 140,
                initialPosition: Offset(850, 400),
              ),
              const DraggableLiquidoWidget(
                width: 120,
                height: 120,
                initialPosition: Offset(50, 500),
              ),
            ],
          ),
        ),
      );

  Widget _buildTechPoint(String title, String description) {
    return Column(
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
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black87,
            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
          ),
        ),
      ],
    );
  }
}
