import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_presentation/main.dart';

void main() {
  patrolTest(
    'navigate through all slides and test demo functionality',
    ($) async {
      await $.pumpWidgetAndSettle(const FlutterDeckExample());

      // Slide data with steps information
      final slideTests = [
        {'key': 'patrolTitle', 'steps': 1}, // Title slide
        {'key': 'lucasImage', 'steps': 1}, // Speaker slide
        {'key': 'qrCode', 'steps': 1}, // QR Code slide
        {'key': null, 'steps': 1}, // Question 1 slide
        {'key': null, 'steps': 1}, // Question 2 slide
        {'key': null, 'steps': 1}, // Question 3 slide
        {'key': null, 'steps': 7}, // Problem slide (has 7 steps)
        {'key': null, 'steps': 4}, // Current solutions slide (has 4 steps)
        {'key': null, 'steps': 1}, // Native tooling problems slide
        {'key': null, 'steps': 1}, // Appium problems slide
        {'key': null, 'steps': 1}, // Enter Patrol slide
        {'key': null, 'steps': 3}, // Patrol different slide (has 3 steps)
        {'key': null, 'steps': 3}, // Test authoring slide (has 3 steps)
        {'key': null, 'steps': 3}, // Under the hood slide (has 3 steps)
        {'key': null, 'steps': 2}, // Real features slide (has 2 steps)
        {'key': null, 'steps': 1}, // Summary slide
        {'key': null, 'steps': 1}, // Codemagic Patrol slide
        {'key': 'demoTitle', 'steps': 1, 'isDemo': true}, // Demo slide
        {'key': 'closingTitle', 'steps': 1}, // Closing slide
      ];

      for (var i = 0; i < slideTests.length; i++) {
        final slideTest = slideTests[i];

        // Wait for the slide to load by checking for a key if available
        if (slideTest['key'] != null) {
          await $(Key(slideTest['key']! as String)).waitUntilExists();
        }

        // Handle demo slide special functionality
        if (slideTest['isDemo'] == true) {
          // Wait for demo content to be visible
          await $(#demoTitle).waitUntilExists();
          await $(#demoButton).waitUntilExists();

          // Click the demo button
          await $.tap($(#demoButton));
          await $.pumpAndSettle();

          // Verify success message appears
          await $(#demoSuccess).waitUntilExists();

          // Verify button is no longer visible
          expect($(#demoButton), findsNothing);
        }

        // Navigate through all steps of this slide
        final steps = slideTest['steps']! as int;
        for (var step = 0; step < steps; step++) {
          // Only navigate if not the last step of the last slide
          if (!(i == slideTests.length - 1 && step == steps - 1)) {
            await $.tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
            await $.pumpAndSettle();
          }
        }
      }
    },
  );
}
