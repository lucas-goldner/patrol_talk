import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/models/test_types.dart';
import 'package:patrol_presentation/services/websocket_service.dart';
import 'package:patrol_presentation/widgets/animated_graph_widget.dart';

class Question2Slide extends FlutterDeckSlideWidget {
  const Question2Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/question-2',
            title: 'Question 2: Which kind of tests do you write?',
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
                  'Which kind of tests do you write?',
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
                      TestTypes testTypes;
                      
                      if (snapshot.hasData) {
                        try {
                          testTypes = TestTypes.fromJson(
                            snapshot.data!['question_2'] as Map<String, dynamic>? ?? {},
                          );
                        } on Exception {
                          testTypes = TestTypes(
                            unitTests: 0,
                            widgetTests: 0,
                            integrationTests: 0,
                          );
                        }
                      } else {
                        testTypes = TestTypes(
                          unitTests: 0,
                          widgetTests: 0,
                          integrationTests: 0,
                        );
                      }

                      final graphData = [
                        GraphData(
                          label: 'Unit Tests',
                          value: testTypes.unitTests,
                          color: Colors.blue,
                        ),
                        GraphData(
                          label: 'Widget Tests',
                          value: testTypes.widgetTests,
                          color: Colors.orange,
                        ),
                        GraphData(
                          label: 'Integration Tests',
                          value: testTypes.integrationTests,
                          color: Colors.purple,
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