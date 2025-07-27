import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class DemoSlide extends FlutterDeckSlideWidget {
  const DemoSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/demo',
            title: 'デモ',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(64),
            child: Center(
              child: _DemoContent(),
            ),
          ),
        ),
      );
}

class _DemoContent extends StatefulWidget {
  const _DemoContent();

  @override
  State<_DemoContent> createState() => _DemoContentState();
}

class _DemoContentState extends State<_DemoContent> {
  bool _showSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "実行してみましょう！",
          key: const Key('demoTitle'),
          style: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
          ),
        ),
        const SizedBox(height: 80),
        if (!_showSuccess) ...[
          ElevatedButton(
            key: const Key('demoButton'),
            onPressed: () {
              setState(() {
                _showSuccess = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[600],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
            ),
            child: Text(
              'クリックしてください',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
            ),
          ),
        ] else ...[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 40,
            ),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.green.withValues(alpha: 0.5),
                width: 3,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 64,
                  color: Colors.green[700],
                ),
                const SizedBox(width: 20),
                Text(
                  '成功！',
                  key: const Key('demoSuccess'),
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
