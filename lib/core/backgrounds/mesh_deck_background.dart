import 'package:flutter/material.dart';
import 'package:mesh/mesh.dart';

class MeshDeckBackground extends StatelessWidget {
  const MeshDeckBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return OMeshGradient(
      mesh: OMeshRect(
        width: 3,
        height: 3,
        vertices: [
          // Positions are in a normalized space
          // where top-left is 0,0 and bottom right is 1,1

          // Row 1
          (-0.06, -0.08).v,
          (0.58, -0.05).v,
          (1.36, 0.04).v,

          // Row 2
          (-0.02, 0.31).v,
          (0.44, 0.63).v,
          (1.11, 0.4).v,

          // Row 3
          (-0.01, 1.01).v,
          (1.01, 1.0).v,
          (1.02, 0.73).v,
        ],
        colors: const [
          // Row 1
          Color(0xff87CEEB), // Sky blue
          Color(0xffFFD700), // Gold yellow
          Color(0xffADD8E6), // Light blue

          // Row 2
          Color(0xffFFF8DC), // Cornsilk (light yellow)
          Color(0xffB0E0E6), // Powder blue
          Color(0xffFFEB3B), // Yellow

          // Row 3
          Color(0xff87CEFA), // Light sky blue
          Color(0xffFFFACD), // Lemon chiffon (pale yellow)
          Color(0xff9DD9F3), // Lighter blue
        ],
      ),
    );
  }
}
