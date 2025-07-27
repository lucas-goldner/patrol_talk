import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/hooks/use_websocket_messages.dart';
import 'package:patrol_presentation/models/integration_test_preference.dart';
import 'package:patrol_presentation/models/question_type.dart';
import 'package:patrol_presentation/widgets/animated_graph_widget.dart';

class Question3Slide extends FlutterDeckSlideWidget {
  const Question3Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/question-3',
            title: '質問3: インテグレーションテストを書くのは好きですか？',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const _Question3SlideContent(),
      );
}

class _Question3SlideContent extends HookWidget {
  const _Question3SlideContent();

  @override
  Widget build(BuildContext context) {
    final integrationPreference =
        useWebSocketMessages<IntegrationTestPreference>(
      questionType: QuestionType.question3,
      defaultValue: IntegrationTestPreference(
        yes: 0,
        no: 0,
      ),
    );

    final graphData = [
      GraphData(
        label: 'はい',
        value: integrationPreference.yes,
        color: Colors.green,
      ),
      GraphData(
        label: 'いいえ',
        value: integrationPreference.no,
        color: Colors.red,
      ),
    ];

    return SlideWithMesh(
      child: GlassContainer(
        margin: const EdgeInsets.all(32),
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'インテグレーションテストを書くのは好きですか？',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Expanded(
              child: AnimatedGraphWidget(
                data: graphData,
                backgroundColor: Colors.transparent,
                labelFontSize: 28,
                valueFontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}