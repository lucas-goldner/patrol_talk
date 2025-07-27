import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeSlide extends FlutterDeckSlideWidget {
  const QrCodeSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/qr-code',
            title: 'QRコード',
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
                    'スキャンしてください',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: QrImageView(
                      key: const Key('qrCode'),
                      data: 'https://presentation-answer.globeapp.dev/',
                      size: 400,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Patrol ドキュメント',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black54,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
