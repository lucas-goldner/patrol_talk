import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/hooks/use_websocket_messages.dart';
import 'package:patrol_presentation/models/question_type.dart';
import 'package:patrol_presentation/models/testing_question_answers_count.dart';
import 'package:patrol_presentation/services/websocket_service.dart';
import 'package:patrol_presentation/widgets/animated_graph_widget.dart';

class Question1Slide extends FlutterDeckSlideWidget {
  const Question1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/question-1',
            title: '質問1: テストを書いていますか？',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => const _Question1SlideContent(),
      );
}

class _Question1SlideContent extends HookWidget {
  const _Question1SlideContent();

  @override
  Widget build(BuildContext context) {
    // Connect to WebSocket when this slide is shown
    useEffect(
      () {
        WebSocketService().connect();
        return null;
      },
      [],
    );

    final testingData = useWebSocketMessages<TestingQuestionAnswersCount>(
      questionType: QuestionType.question1,
      defaultValue: TestingQuestionAnswersCount(
        doesTest: 0,
        doesNotTest: 0,
      ),
    );

    final graphData = [
      GraphData(
        label: 'テストを書く',
        value: testingData.doesTest,
        color: Colors.green,
      ),
      GraphData(
        label: 'テストを書かない',
        value: testingData.doesNotTest,
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
              'テストを書いていますか？',
              style: TextStyle(
                fontSize: 56,
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
