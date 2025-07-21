import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class FlutterEngineersSlide extends FlutterDeckSlideWidget {
  const FlutterEngineersSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-engineers',
            title: 'Flutterエンジニアとしてどうすればいい？',
            steps: 4,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => FlutterDeckSlideStepsBuilder(
          builder: (context, stepNumber) => SlideWithMesh(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Flutterエンジニアとしてどうすればいい？',
                    style: TextStyle(
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  if (stepNumber >= 2) ...[
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: stepNumber >= 2 ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          child: _buildCard(
                            icon: Icons.celebration,
                            title: '新しい挑戦',
                            content: 'Appleが常に新しい挑戦を続けている点にワクワク✨',
                          ),
                        ),
                        const SizedBox(width: 30),
                        AnimatedOpacity(
                          opacity: stepNumber >= 3 ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          child: _buildCard(
                            icon: Icons.help_outline,
                            title: '課題',
                            content: 'このアプリをどのようにアップデートすべきか🤔',
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (stepNumber >= 4) ...[
                    const SizedBox(height: 30),
                    AnimatedOpacity(
                      opacity: stepNumber >= 4 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 600),
                      child: GlassContainer(
                        width: 800,
                        height: 300,
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CupertinoWidgets🧩でiOS風のダイアログを提供',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black87,
                                fontFamily:
                                    GoogleFonts.ibmPlexSansJp().fontFamily,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'しかし、完全な再現には数ヶ月単位の開発期間📆と高い実装難易度📐が必要',
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.black87,
                                fontFamily:
                                    GoogleFonts.ibmPlexSansJp().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return GlassContainer(
      width: 350,
      height: 300,
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.black87,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
