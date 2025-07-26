import 'package:flutter/material.dart';
import 'package:mesh/mesh.dart';

class SlideWithMesh extends StatelessWidget {
  const SlideWithMesh({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Mesh background
        Positioned.fill(
          child: OMeshGradient(
            mesh: OMeshRect(
              width: 3,
              height: 3,
              vertices: [
                (-0.06, -0.08).v, (0.58, -0.05).v, (1.36, 0.04).v,
                (-0.02, 0.31).v, (0.44, 0.63).v, (1.11, 0.4).v,
                (-0.01, 1.01).v, (1.01, 1.0).v, (1.02, 0.73).v,
              ],
              colors: const [
                Color(0xff87CEEB), Color(0xffFFD700), Color(0xffADD8E6),
                Color(0xffFFF8DC), Color(0xffB0E0E6), Color(0xffFFEB3B),
                Color(0xff87CEFA), Color(0xffFFFACD), Color(0xff9DD9F3),
              ],
            ),
          ),
        ),
        // Content
        child,
      ],
    );
  }
}
