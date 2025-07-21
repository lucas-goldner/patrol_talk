import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/models/testing_question_answers_count.dart';
import 'package:patrol_presentation/services/websocket_service.dart';
import 'package:patrol_presentation/widgets/animated_graph_widget.dart';

class Question1Slide extends FlutterDeckSlideWidget {
  const Question1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/question-1',
            title: 'Question 1: Do you write tests?',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do you write tests?',
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
                  child: StreamBuilder<Map<String, dynamic>>(
                    stream: WebSocketService().resultsStream,
                    builder: (context, snapshot) {
                      TestingQuestionAnswersCount testingData;
                      
                      if (snapshot.hasData) {
                        try {
                          testingData = TestingQuestionAnswersCount.fromJson(
                            snapshot.data!['question_1']
                                    as Map<String, dynamic>? ??
                                {},
                          );
                        } on Exception {
                          testingData = TestingQuestionAnswersCount(
                            doesTest: 0,
                            doesNotTest: 0,
                          );
                        }
                      } else {
                        testingData = TestingQuestionAnswersCount(
                          doesTest: 0,
                          doesNotTest: 0,
                        );
                      }

                      final graphData = [
                        GraphData(
                          label: 'Write Tests',
                          value: testingData.doesTest,
                          color: Colors.green,
                        ),
                        GraphData(
                          label: "Don't Write Tests",
                          value: testingData.doesNotTest,
                          color: Colors.red,
                        ),
                      ];

                      return AnimatedGraphWidget(
                        data: graphData,
                        backgroundColor: Colors.transparent,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
