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
            title: 'Real Features',
            steps: 2,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
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
                        'Real Features',
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
                    'Patrol supports out-of-the-box:',
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
                          title: 'WebView logins',
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        _FeatureCard(
                          icon: Icons.chat_bubble,
                          title: 'System dialogs',
                          color: Colors.green,
                        ),
                        const SizedBox(width: 20),
                        _FeatureCard(
                          icon: Icons.notifications,
                          title: 'Push notifications',
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 20),
                        _FeatureCard(
                          icon: Icons.dark_mode,
                          title: 'Dark mode UI',
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
                        'Used in production by LeanCode and dozens of companies—battle-tested.',
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
    return GlassContainer(
      width: 200,
      height: 120,
      padding: const EdgeInsets.all(20),
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