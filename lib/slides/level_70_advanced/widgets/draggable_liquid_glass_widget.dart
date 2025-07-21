import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class DraggableLiquidGlassWidget extends StatefulWidget {
  const DraggableLiquidGlassWidget({
    super.key,
    this.width = 200,
    this.height = 200,
    this.initialPosition,
  });

  final double width;
  final double height;
  final Offset? initialPosition;

  @override
  State<DraggableLiquidGlassWidget> createState() =>
      _DraggableLiquidGlassWidgetState();
}

class _DraggableLiquidGlassWidgetState extends State<DraggableLiquidGlassWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Offset _position;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _position = widget.initialPosition ?? const Offset(100, 100);

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updatePosition(Offset delta) {
    setState(() {
      _position += delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: GestureDetector(
        onPanStart: (details) {
          setState(() {
            _isDragging = true;
          });
        },
        onPanUpdate: (details) {
          _updatePosition(details.delta);
        },
        onPanEnd: (details) {
          setState(() {
            _isDragging = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..scale(_isDragging ? 1.1 : 1.0, _isDragging ? 1.1 : 1.0, 1),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: _isDragging ? 0.3 : 0.15,
                  ),
                  blurRadius: _isDragging ? 20 : 12,
                  offset: Offset(0, _isDragging ? 8 : 6),
                ),
              ],
            ),
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return LiquidGlass(
                  shape: const LiquidRoundedSuperellipse(
                    borderRadius: Radius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _isDragging ? Icons.touch_app : Icons.pan_tool,
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isDragging ? 'Dragging!' : 'Drag Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
