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
            title: 'What Makes Patrol Different?',
            steps: 3,
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
                  Text(
                    '🧱 What Makes Patrol Different?',
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
                          title: 'Builds on flutter_test',
                          description: 'Full Dart support',
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 30),
                        _FeatureCard(
                          icon: Icons.phone_android,
                          title: 'Native Automation',
                          description: 'UIAutomator & XCUITest',
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                  if (step >= 2) ...[
                    const SizedBox(height: 40),
                    GlassContainer(
                      width: 900,
                      height: 150,
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _CheckItem(text: 'Tap native permission dialogs'),
                              const SizedBox(width: 40),
                              _CheckItem(text: 'Interact with WebViews'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _CheckItem(text: 'Toggle Wi-Fi, dark mode'),
                              const SizedBox(width: 40),
                              _CheckItem(text: 'Works with device farms'),
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
                            'Intuitive API — No pumpAndSettle() hell',
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
    return GlassContainer(
      width: 350,
      height: 200,
      padding: const EdgeInsets.all(30),
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