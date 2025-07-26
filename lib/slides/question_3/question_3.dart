import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/models/integration_test_preference.dart';
import 'package:patrol_presentation/services/websocket_service.dart';
import 'package:patrol_presentation/widgets/animated_graph_widget.dart';

class Question3Slide extends FlutterDeckSlideWidget {
  const Question3Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/question-3',
            title: 'Question 3: Do you like writing integration tests?',
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
                  'Do you like writing integration tests?',
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
                      IntegrationTestPreference integrationPreference;
                      
                      if (snapshot.hasData) {
                        try {
                          integrationPreference = IntegrationTestPreference.fromJson(
                            snapshot.data!['question_3'] as Map<String, dynamic>? ?? {},
                          );
                        } on Exception {
                          integrationPreference = IntegrationTestPreference();
                        }
                      } else {
                        integrationPreference = IntegrationTestPreference();
                      }

                      final graphData = [
                        GraphData(
                          label: 'Like Integration Tests',
                          value: integrationPreference.yes,
                          color: Colors.green,
                        ),
                        GraphData(
                          label: "Don't Like Integration Tests",
                          value: integrationPreference.no,
                          color: Colors.red,
                        ),
                      ];

                      return AnimatedGraphWidget(
                        data: graphData,
                        backgroundColor: Colors.transparent,
                        labelFontSize: 28,
                        valueFontSize: 36,
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