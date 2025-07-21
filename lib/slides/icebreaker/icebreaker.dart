import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class IcebreakerSlide extends FlutterDeckSlideWidget {
  const IcebreakerSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/icebreaker',
            title: 'Opening & Icebreaker',
            steps: 4,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: FlutterDeckSlideStepsBuilder(
            builder: (context, step) => Center(
              child: GlassContainer(
                width: 900,
                height: 600,
                padding: const EdgeInsets.all(60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey everyone! Quick show of hands:',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (step >= 1) ...[
                      const _QuestionItem(
                        icon: Icons.check_circle_outline,
                        text: 'Who here writes tests for their Flutter apps?',
                      ),
                      const SizedBox(height: 20),
                    ],
                    if (step >= 2) ...[
                      const _QuestionItem(
                        icon: Icons.code,
                        text: 'Unit tests? Widget tests?',
                      ),
                      const SizedBox(height: 20),
                    ],
                    if (step >= 3) ...[
                      const _QuestionItem(
                        icon: Icons.phone_android,
                        text: '…Integration tests?',
                      ),
                      const SizedBox(height: 40),
                    ],
                    if (step >= 4) ...[
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.red.withValues(alpha: 0.3),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.sentiment_dissatisfied,
                              size: 48,
                              color: Colors.red[700],
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                'Okay… and who enjoys writing integration tests?',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red[700],
                                  fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Exactly. They\'re slow, verbose, and feel like fighting the framework itself.\nBut what if I told you we now have a better way?',
                        style: TextStyle(
                          fontSize: 28,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
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

class _QuestionItem extends StatelessWidget {
  const _QuestionItem({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 36,
          color: Colors.blue[700],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
