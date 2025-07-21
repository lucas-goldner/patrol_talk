import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class LiquidGlassPackageWidget extends StatefulWidget {
  const LiquidGlassPackageWidget({
    super.key,
    this.width = 300,
    this.height = 300,
    this.child,
  });

  final double width;
  final double height;
  final Widget? child;

  @override
  State<LiquidGlassPackageWidget> createState() =>
      _LiquidGlassPackageWidgetState();
}

class _LiquidGlassPackageWidgetState extends State<LiquidGlassPackageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return LiquidGlass(
            shape: const LiquidRoundedSuperellipse(
              borderRadius: Radius.circular(16),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Liquid Glass',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
