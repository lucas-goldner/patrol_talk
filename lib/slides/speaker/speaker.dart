import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class SpeakerSlide extends FlutterDeckSlideWidget {
  const SpeakerSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/speaker',
            title: 'Speaker Introduction',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(64),
            child: Row(
              children: [
                // Left side - Profile image
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue.withValues(alpha: 0.3),
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/lucas.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                // Right side - Information
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lucas Goldner',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 30),
                      _InfoItem(
                        icon: Icons.star,
                        text: 'Flutter & Dart Google Developer Expert',
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 20),
                      _InfoItem(
                        icon: Icons.group,
                        text: 'Flutter Tokyo Organizer',
                        color: Colors.purple,
                      ),
                      const SizedBox(height: 20),
                      _InfoItem(
                        icon: Icons.work,
                        text: 'Flutter Engineer at Youtrust',
                        color: Colors.green,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        '🎯 Hobbies',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _HobbyItem(text: '📱 Working on my own apps'),
                      _HobbyItem(text: '🌍 Learning languages (speak 5!)'),
                      _HobbyItem(text: '🇯🇵 Learning Japanese now'),
                      _HobbyItem(text: '🎤 Karaoke'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
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
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(width: 20),
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

class _HobbyItem extends StatelessWidget {
  const _HobbyItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black87,
          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
        ),
      ),
    );
  }
}
