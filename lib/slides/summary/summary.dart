import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class SummarySlide extends FlutterDeckSlideWidget {
  const SummarySlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/summary',
            title: 'まとめ',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(64),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '🎯 まとめ',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Flutterについにふさわしいテストフレームワークが誕生しました',
                      style: TextStyle(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          _SummaryItem(
                            icon: Icons.phone_android,
                            text: 'ネイティブUI自動化',
                            color: Colors.blue,
                          ),
                          const SizedBox(height: 12),
                          _SummaryItem(
                            icon: Icons.api,
                            text: '直感的なAPI',
                            color: Colors.green,
                          ),
                          const SizedBox(height: 12),
                          _SummaryItem(
                            icon: Icons.security,
                            text: '完全な分離',
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 12),
                          _SummaryItem(
                            icon: Icons.cloud_done,
                            text: 'デバイスファームサポート',
                            color: Colors.purple,
                          ),
                          const SizedBox(height: 12),
                          _SummaryItem(
                            icon: Icons.business,
                            text: '現実世界での本番使用',
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.green.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'Patrolはflutter_testの強化版です',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.icon,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 20,
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
          ),
        ),
      ],
    );
  }
}