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
            title: 'Summary',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🎯 Summary',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Flutter finally has a test framework it deserves',
                  style: TextStyle(
                    fontSize: 32,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 40),
                GlassContainer(
                  width: 900,
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      _SummaryItem(
                        icon: Icons.phone_android,
                        text: 'Native UI automation',
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 20),
                      _SummaryItem(
                        icon: Icons.api,
                        text: 'Intuitive API',
                        color: Colors.green,
                      ),
                      const SizedBox(height: 20),
                      _SummaryItem(
                        icon: Icons.security,
                        text: 'Full isolation',
                        color: Colors.orange,
                      ),
                      const SizedBox(height: 20),
                      _SummaryItem(
                        icon: Icons.cloud_done,
                        text: 'Device farm support',
                        color: Colors.purple,
                      ),
                      const SizedBox(height: 20),
                      _SummaryItem(
                        icon: Icons.business,
                        text: 'Real-world production use',
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
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
                    'Patrol is like flutter_test on steroids',
                    style: TextStyle(
                      fontSize: 32,
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
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 28,
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
          ),
        ),
      ],
    );
  }
}