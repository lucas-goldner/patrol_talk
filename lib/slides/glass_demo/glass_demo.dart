import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class GlassDemoSlide extends FlutterDeckSlideWidget {
  const GlassDemoSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/glass-demo',
            title: 'Glass Container Auto-Sizing Demo',
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
                    'Glass Container Auto-Sizing',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (step >= 1) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Small content
                        GlassContainer(
                          child: Text(
                            'Short text',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                        ),
                        if (step >= 2)
                          // Medium content
                          GlassContainer(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Medium Content',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'This container automatically\nsizes to fit its content',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (step >= 3)
                          // Large content
                          GlassContainer(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Large Content Area',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ...List.generate(3, (index) => 
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.check, color: Colors.green, size: 20),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Feature ${index + 1}: Auto-sizing',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'No width or height specified - containers auto-size to content!',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue[700],
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
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