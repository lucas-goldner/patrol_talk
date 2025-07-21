import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class CurrentSolutionsSlide extends FlutterDeckSlideWidget {
  const CurrentSolutionsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/current-solutions',
            title: 'Current Solutions',
            steps: 4,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(64),
            child: FlutterDeckSlideStepsBuilder(
              builder: (context, step) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🧪 Current Solutions',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (step >= 1)
                        _SolutionCard(
                          title: 'test',
                          description: 'Great for unit tests',
                          icon: Icons.check_circle,
                          color: Colors.green,
                        ),
                      if (step >= 1) const SizedBox(width: 20),
                      if (step >= 2)
                        _SolutionCard(
                          title: 'flutter_test',
                          description: 'Used for widget tests',
                          icon: Icons.widgets,
                          color: Colors.blue,
                        ),
                      if (step >= 2) const SizedBox(width: 20),
                      if (step >= 3)
                        _SolutionCard(
                          title: 'integration_test',
                          description: 'End-to-end tests',
                          icon: Icons.phone_android,
                          color: Colors.orange,
                        ),
                    ],
                  ),
                  if (step >= 4) ...[
                    const SizedBox(height: 60),
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.red.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'But here\'s the catch...',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[700],
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Flutter integration tests are treated as Dart-only',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black87,
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Meanwhile, native tooling expects JUnit or XCTest',
                            style: TextStyle(
                              fontSize: 24,
                              fontStyle: FontStyle.italic,
                              color: Colors.black54,
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

class _SolutionCard extends StatelessWidget {
  const _SolutionCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: color,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}