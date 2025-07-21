import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({
    required this.child,
    this.delay = 0,
    super.key,
  });

  final Widget child;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          delay: Duration(seconds: delay),
          duration: const Duration(milliseconds: 800),
        ),
      ],
      child: child,
    );
  }
}
