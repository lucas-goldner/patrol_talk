import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class UnderTheHoodSlide extends FlutterDeckSlideWidget {
  const UnderTheHoodSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/under-the-hood',
            title: 'Under the Hood',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 56,
                        color: Colors.blue[700],
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Under the Hood',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  if (step >= 1) ...[
                    GlassContainer(
                      width: 900,
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How does it work?',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _FeatureItem(
                            text: 'Replaces integration_test with a Patrol plugin',
                          ),
                          const SizedBox(height: 12),
                          _FeatureItem(
                            text: 'Flows: patrol_test → flutter_test → test package',
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (step >= 2) ...[
                    const SizedBox(height: 30),
                    GlassContainer(
                      width: 900,
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Each test runs:',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _BenefitItem(
                            icon: Icons.memory,
                            text: 'In its own app process',
                          ),
                          _BenefitItem(
                            icon: Icons.security,
                            text: 'With full isolation',
                          ),
                          _BenefitItem(
                            icon: Icons.bug_report,
                            text: 'Crash-resilient—one crash won\'t affect others',
                          ),
                          _BenefitItem(
                            icon: Icons.dashboard,
                            text: 'Supports sharding',
                          ),
                          _BenefitItem(
                            icon: Icons.timer,
                            text: 'Reports durations correctly',
                          ),
                          if (step >= 3)
                            _BenefitItem(
                              icon: Icons.local_fire_department,
                              text: 'Hot-restart friendly during dev 🔥',
                              color: Colors.orange,
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

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}

class _BenefitItem extends StatelessWidget {
  const _BenefitItem({
    required this.icon,
    required this.text,
    this.color,
  });

  final IconData icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Colors.green[600];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: effectiveColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}