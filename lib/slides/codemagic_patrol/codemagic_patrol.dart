import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class CodemagicPatrolSlide extends FlutterDeckSlideWidget {
  const CodemagicPatrolSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/codemagic-patrol',
            title: 'Codemagic Patrol',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/codemagic-patrol.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
}
