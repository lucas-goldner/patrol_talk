import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquido/liquido.dart';

class DraggableLiquidoWidget extends StatefulWidget {
  const DraggableLiquidoWidget({
    super.key,
    this.width = 200,
    this.height = 200,
    this.initialPosition,
  });

  final double width;
  final double height;
  final Offset? initialPosition;

  @override
  State<DraggableLiquidoWidget> createState() => _DraggableLiquidoWidgetState();
}

class _DraggableLiquidoWidgetState extends State<DraggableLiquidoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Offset _position;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _position = widget.initialPosition ?? const Offset(100, 100);

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
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final animValue = _animationController.value;
                return Stack(
                  children: [
                    // Background gradient container behind the glass
                    SizedBox(
                      width: widget.width,
                      height: widget.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isDragging ? Icons.blur_on : Icons.auto_fix_high,
                            size: 48,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _isDragging ? 'Liquido!' : 'Liquido',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Level 80',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Glass effect on top
                    Glass(
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(_isDragging ? 40 : 30),
                        ),
                      ),
                      child: SizedBox(
                        width: widget.width,
                        height: widget.height,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
