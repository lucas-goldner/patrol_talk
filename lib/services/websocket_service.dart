import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  factory WebSocketService() => _instance;
  WebSocketService._internal();

  static final WebSocketService _instance = WebSocketService._internal();

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  final StreamController<String> _resultsController =
      StreamController<String>.broadcast();

  Stream<String> get resultsStream => _resultsController.stream;

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
            print('WebSocket received message: $message');
          }
          _resultsController.add(message.toString());
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

}
