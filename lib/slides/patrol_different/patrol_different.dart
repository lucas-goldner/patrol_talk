import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class PatrolDifferentSlide extends FlutterDeckSlideWidget {
  const PatrolDifferentSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/patrol-different',
            title: 'Patrolの何が違うのか？',
            steps: 3,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(64),
            child: FlutterDeckSlideStepsBuilder(
              builder: (context, step) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    '🧱 Patrolの何が違うのか？',
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (step >= 1) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _FeatureCard(
                          icon: Icons.code,
                          title: 'flutter_testをベースに構築',
                          description: '完全なDartサポート',
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 30),
                        _FeatureCard(
                          icon: Icons.phone_android,
                          title: 'ネイティブ自動化',
                          description: 'UIAutomator & XCUITest',
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                  if (step >= 2) ...[
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const _CheckItem(text: 'ネイティブパーミションダイアログをタップ'),
                              const SizedBox(width: 40),
                              const _CheckItem(text: 'WebViewとの連携'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const _CheckItem(text: 'Wi-Fi、ダークモード切り替え'),
                              const SizedBox(width: 40),
                              const _CheckItem(text: 'デバイスファームとの連携'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (step >= 3) ...[
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.purple.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            size: 36,
                            color: Colors.purple[700],
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '直感的なAPI — pumpAndSettle()地獄からの解放',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple[700],
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 56,
            color: color,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  const _CheckItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          size: 24,
          color: Colors.green[600],
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
          ),
        ),
      ],
    );
  }
}