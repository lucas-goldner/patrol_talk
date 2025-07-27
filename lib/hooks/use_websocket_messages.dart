import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:patrol_presentation/models/integration_test_preference.dart';
import 'package:patrol_presentation/models/question_type.dart';
import 'package:patrol_presentation/models/test_types.dart';
import 'package:patrol_presentation/models/testing_question_answers_count.dart';
import 'package:patrol_presentation/services/websocket_service.dart';

T useWebSocketMessages<T>({
  required QuestionType questionType,
  required T defaultValue,
}) {
  final result = useState<T>(defaultValue);
  
  useStream(
    WebSocketService().resultsStream,
    preserveState: false,
  );

  useEffect(() {
    late StreamSubscription<String> subscription;
    
    subscription = WebSocketService().resultsStream.listen((message) {
      try {
        switch (questionType) {
          case QuestionType.question1:
            if (message.contains('TestingQuestionAnswersCount(')) {
              final regex = RegExp(r'doesTest: (\d+), doesNotTest: (\d+)');
              final match = regex.firstMatch(message);
              if (match != null) {
                result.value = TestingQuestionAnswersCount(
                  doesTest: int.parse(match.group(1)!),
                  doesNotTest: int.parse(match.group(2)!),
                ) as T;
              }
            }
          case QuestionType.question2:
            if (message.contains('TestTypes(')) {
              final regex = RegExp(
                r'unitTests: (\d+), widgetTests: (\d+), integrationTests: (\d+)',
              );
              final match = regex.firstMatch(message);
              if (match != null) {
                result.value = TestTypes(
                  unitTests: int.parse(match.group(1)!),
                  widgetTests: int.parse(match.group(2)!),
                  integrationTests: int.parse(match.group(3)!),
                ) as T;
              }
            }
          case QuestionType.question3:
            if (message.contains('IntegrationTestPreference(')) {
              final regex = RegExp(r'yes: (\d+), no: (\d+)');
              final match = regex.firstMatch(message);
              if (match != null) {
                result.value = IntegrationTestPreference(
                  yes: int.parse(match.group(1)!),
                  no: int.parse(match.group(2)!),
                ) as T;
              }
            }
        }
      } on Exception {
        // Keep default value on parsing error
      }
    });

    return subscription.cancel;
  }, [questionType],);

  return result.value;
}
