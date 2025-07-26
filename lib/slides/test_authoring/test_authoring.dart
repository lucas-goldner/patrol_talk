import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class TestAuthoringSlide extends FlutterDeckSlideWidget {
  const TestAuthoringSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/test-authoring',
            title: 'Test Authoring Demo',
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
              builder: (context, step) => Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '🧠 Test Authoring Demo',
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Side-by-side: integration_test vs. Patrol',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black54,
                            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (step >= 1)
                              _CodeComparisonCard(
                                title: 'integration_test (verbose)',
                                color: Colors.red,
                                code: '''// Traditional approach
await tester.pumpAndSettle();
await tester.enterText(
  find.byKey(Key('email')), 
  'charlie@root.me'
);
await tester.pumpAndSettle();
await tester.enterText(
  find.byKey(Key('password')), 
  'password123'
);
await tester.pumpAndSettle();
await tester.tap(
  find.text('Sign Up')
);
await tester.pumpAndSettle();''',
                              ),
                            if (step >= 1) const SizedBox(width: 30),
                            if (step >= 2)
                              _CodeComparisonCard(
                                title: 'Patrol (concise)',
                                color: Colors.green,
                                code: r'''// Patrol approach
await $('email').enter('charlie@root.me');
await $('password').enter('password123');
await $('Sign Up').tap();
expect($('Welcome, Charlie!'), exists);''',
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (step >= 3)
                    Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: _AnimatedStatCard(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _AnimatedStatCard extends StatefulWidget {
  const _AnimatedStatCard();

  @override
  State<_AnimatedStatCard> createState() => _AnimatedStatCardState();
}

class _AnimatedStatCardState extends State<_AnimatedStatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Create a springy bounce animation
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    // Add a slight rotation for more dynamic effect
    _rotationAnimation = Tween<double>(
      begin: -0.1,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha: 0.3),
                    blurRadius: 25,
                    offset: const Offset(0, 15),
                  ),
                ],
                border: Border.all(
                  color: Colors.blue.withValues(alpha: 0.5),
                  width: 3,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.trending_down,
                        size: 64,
                        color: Colors.blue[700],
                      ),
                      const SizedBox(width: 24),
                      Text(
                        '50% shorter code',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '🤖 AI assistants can write it reliably now!',
                    style: TextStyle(
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CodeComparisonCard extends StatelessWidget {
  const _CodeComparisonCard({
    required this.title,
    required this.color,
    required this.code,
  });

  final String title;
  final Color color;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ),
        Container(
          width: 450,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Text(
            code,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'monospace',
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
