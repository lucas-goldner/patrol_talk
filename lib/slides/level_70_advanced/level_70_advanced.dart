import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/slides/level_70_advanced/widgets/draggable_liquid_glass_widget.dart';

class Level70AdvancedSlide extends FlutterDeckSlideWidget {
  const Level70AdvancedSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/level-70-advanced',
            title: 'Level 70：先進的なLiquid Glass実装',
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
                      'Level 70：先進的なLiquid Glass実装',
                      style: TextStyle(
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'by @ImadeTheseWorks',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.blue.shade800,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFeature(
                          '高レベルカスタムウィジェット🧩',
                          'Glass, GlassRenderer, GlassOptions',
                        ),
                        const SizedBox(width: 20),
                        _buildFeature(
                          'パイプライン拡張🚦',
                          'Shaderロード、パラメータ設定、描画パス',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFeature(
                          'オプション構成⚙️',
                          'blurSigma, contrast, saturation等',
                        ),
                        const SizedBox(width: 20),
                        _buildFeature(
                          'Flutter統合🔗',
                          'RenderObject拡張で高度な制御',
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    GlassContainer(
                      width: 600,
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'liquid_glass_rendererパッケージ - ドラッグ可能デモ',
                          style: TextStyle(
                            fontSize: 30,
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
              // Draggable liquid glass widgets
              const DraggableLiquidGlassWidget(
                width: 180,
                height: 180,
                initialPosition: Offset(100, 300),
              ),
              const DraggableLiquidGlassWidget(
                width: 160,
                height: 160,
                initialPosition: Offset(800, 200),
              ),
              const DraggableLiquidGlassWidget(
                width: 140,
                height: 140,
                initialPosition: Offset(600, 450),
              ),
            ],
          ),
        ),
      );

  Widget _buildFeature(String title, String content) {
    return GlassContainer(
      width: 380,
      height: 200,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
