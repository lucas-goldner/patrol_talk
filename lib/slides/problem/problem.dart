import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class ProblemSlide extends FlutterDeckSlideWidget {
  const ProblemSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/problem',
            title: 'The Problem',
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
              builder: (context, step) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '❌ The Problem',
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[700],
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Flutter has no really great solution for UI testing',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (step >= 1) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ProblemCard(
                          number: '1',
                          title: 'Native UI Interactions',
                          content: 'Permission dialogs, WebViews, Apple/Google sign-in\n\nFlutter can\'t do that.',
                          color: Colors.orange,
                          icon: Icons.phone_android,
                        ),
                        const SizedBox(width: 20),
                        if (step >= 2)
                          _ProblemCard(
                            number: '2',
                            title: 'Verbose Code',
                            content: 'Even the simplest test becomes a\n\nverbose wall of code.',
                            color: Colors.purple,
                            icon: Icons.code_off,
                          ),
                      ],
                    ),
                  ],
                  if (step >= 3) ...[
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '// Simple signup test - Look at this mess!',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green[400],
                              fontFamily: 'monospace',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '''await tester.pumpAndSettle();
await tester.enterText(find.byKey(Key('email')), 'user@example.com');
await tester.pumpAndSettle();
await tester.enterText(find.byKey(Key('password')), 'password123');
await tester.pumpAndSettle();
await tester.tap(find.descendant(
  of: find.ancestor(
    of: find.byType(Form),
    matching: find.byType(Column),
  ),
  matching: find.text('Sign Up'),
));
await tester.pumpAndSettle();''',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'monospace',
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Every pumpAndSettle() has to be manually inserted!',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red[400],
                              fontStyle: FontStyle.italic,
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

class _ProblemCard extends StatelessWidget {
  const _ProblemCard({
    required this.number,
    required this.title,
    required this.content,
    required this.color,
    required this.icon,
  });

  final String number;
  final String title;
  final String content;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Icon(icon, size: 32, color: color),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
