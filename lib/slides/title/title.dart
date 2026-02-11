import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class TitleSlide extends FlutterDeckSlideWidget {
  const TitleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/title-slide',
            title: 'Patrol: FlutterのE2Eテストフレームワーク',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(64),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🧪 Patrol',
                    key: const Key('patrolTitle'),
                    style: TextStyle(
                      fontSize: 88,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'FlutterのE2Eテストフレームワーク',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'もうバグは許さない — Flutter E2Eテスト最終対策',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 64,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/leancode-logo.svg',
                        height: 80,
                      ),
                      const SizedBox(width: 60),
                      Image.asset(
                        'assets/images/patrol.webp',
                        height: 80,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
