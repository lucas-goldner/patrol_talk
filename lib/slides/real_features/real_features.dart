import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class RealFeaturesSlide extends FlutterDeckSlideWidget {
  const RealFeaturesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/real-features',
            title: '実際の機能',
            steps: 2,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.rocket_launch,
                        size: 56,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        '実際の機能',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Patrolは最初からサポート:',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black54,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (step >= 1) ...[
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        '''await native.enableCellular();
await native.disableWifi();
await native.grantPermission('location');
await native.tapOnNotificationByIndex(0);''',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'monospace',
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                  if (step >= 2) ...[
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _FeatureCard(
                          icon: Icons.web,
                          title: 'WebViewログイン',
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        _FeatureCard(
                          icon: Icons.chat_bubble,
                          title: 'システムダイアログ',
                          color: Colors.green,
                        ),
                        const SizedBox(width: 20),
                        _FeatureCard(
                          icon: Icons.notifications,
                          title: 'プッシュ通知',
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 20),
                        _FeatureCard(
                          icon: Icons.dark_mode,
                          title: 'ダークモードUI',
                          color: Colors.purple,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.green.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'LeanCodeや多数の企業で本番使用—実戦でテスト済み。',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[700],
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                        textAlign: TextAlign.center,
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
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            size: 36,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}