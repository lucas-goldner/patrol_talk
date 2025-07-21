import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  factory WebSocketService() => _instance;
  WebSocketService._internal();

  static final WebSocketService _instance = WebSocketService._internal();

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  final StreamController<Map<String, dynamic>> _resultsController =
      StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get resultsStream => _resultsController.stream;

  Future<void> connect() async {
    try {
      final uri = Uri.parse(
        'ws://master-presentation-questions.globeapp.dev/read_results',
      );
      _channel = WebSocketChannel.connect(uri);
      
      if (kDebugMode) {
        print('WebSocket connected to: $uri');
      }

      _subscription = _channel!.stream.listen(
        (message) {
          if (kDebugMode) {
            print('WebSocket received raw message: $message');
          }
          try {
            final data =
                json.decode(message.toString()) as Map<String, dynamic>;
            _resultsController.add(data);
          } on FormatException {
            if (kDebugMode) {
              print('Message is not JSON, parsing as string: $message');
            }
            // Parse string format like: TestingQuestionAnswersCount(doesTest: 2, doesNotTest: 1)
            final parsedData = _parseStringMessage(message.toString());
            if (parsedData != null) {
              _resultsController.add(parsedData);
            }
          }
        },
        onError: (Object error) {
          if (kDebugMode) {
            print('WebSocket error: $error');
          }
        },
        onDone: () {
          if (kDebugMode) {
            print('WebSocket connection closed');
          }
        },
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Failed to connect to WebSocket: $e');
      }
    }
  }

  void disconnect() {
    _subscription?.cancel();
    _channel?.sink.close();
    _subscription = null;
    _channel = null;
  }

  void dispose() {
    disconnect();
    _resultsController.close();
  }

  Map<String, dynamic>? _parseStringMessage(String message) {
    try {
      // Parse TestingQuestionAnswersCount(doesTest: 2, doesNotTest: 1)
      if (message.contains('TestingQuestionAnswersCount(')) {
        final regex = RegExp(r'doesTest: (\d+), doesNotTest: (\d+)');
        final match = regex.firstMatch(message);
        if (match != null) {
          return {
            'question_1': {
              'does_test': int.parse(match.group(1)!),
              'does_not_test': int.parse(match.group(2)!),
            }
          };
        }
      }
      
      // Parse TestTypes(unitTests: 1, widgetTests: 2, integrationTests: 3)
      if (message.contains('TestTypes(')) {
        final regex = RegExp(
          r'unitTests: (\d+), widgetTests: (\d+), integrationTests: (\d+)',
        );
        final match = regex.firstMatch(message);
        if (match != null) {
          return {
            'question_2': {
              'unit_tests': int.parse(match.group(1)!),
              'widget_tests': int.parse(match.group(2)!),
              'integration_tests': int.parse(match.group(3)!),
            }
          };
        }
      }
      
      // Parse IntegrationTestPreference(yes: 1, no: 2)
      if (message.contains('IntegrationTestPreference(')) {
        final regex = RegExp(r'yes: (\d+), no: (\d+)');
        final match = regex.firstMatch(message);
        if (match != null) {
          return {
            'question_3': {
              'yes': int.parse(match.group(1)!),
              'no': int.parse(match.group(2)!),
            }
          };
        }
      }
      
      return null;
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error parsing string message: $e');
      }
      return null;
    }
  }
}
