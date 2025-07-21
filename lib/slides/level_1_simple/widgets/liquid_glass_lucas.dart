import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DraggableLiquidGlass extends StatefulWidget {
  const DraggableLiquidGlass({super.key});

  @override
  State<DraggableLiquidGlass> createState() => _DraggableLiquidGlassState();
}

class _DraggableLiquidGlassState extends State<DraggableLiquidGlass> {
  ui.FragmentShader? _shader;
  ui.Image? _image;
  Offset _position = const Offset(100, 100);
  Offset _touch = Offset.zero;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _loadShaderAndImage();
  }

  Future<void> _loadShaderAndImage() async {
    try {
      // Load the shader
      final program = await ui.FragmentProgram.fromAsset(
        'assets/shaders/liquid_shader_lucas.frag',
      );
      _shader = program.fragmentShader();

      // Load a default image
      final data = await rootBundle.load('assets/images/background.webp');
      _image = await decodeImageFromList(data.buffer.asUint8List());

      setState(() {});
    } on Exception catch (e) {
      debugPrint('Error loading shader or image: $e');
    }
  }

  void _updatePosition(Offset delta) {
    setState(() {
      _position += delta;
    });
  }

  void _updateTouch(Offset localPosition) {
    setState(() {
      _touch = localPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_shader == null || _image == null) {
      return const SizedBox(
        width: 200,
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

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
          _updateTouch(details.localPosition);
        },
        onPanEnd: (details) {
          setState(() {
            _isDragging = false;
          });
        },
        onTapDown: (details) {
          _updateTouch(details.localPosition);
        },
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: _isDragging
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomPaint(
              size: const Size(200, 200),
              painter: _LiquidGlassPainter(
                shader: _shader!,
                image: _image!,
                touch: _touch,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LiquidGlassPainter extends CustomPainter {
  _LiquidGlassPainter({
    required this.shader,
    required this.image,
    required this.touch,
  });

  final ui.FragmentShader shader;
  final ui.Image image;
  final Offset touch;

  @override
  void paint(Canvas canvas, Size size) {
    shader
      ..setFloat(0, size.width)
      ..setFloat(1, size.height)
      ..setFloat(2, touch.dx)
      ..setFloat(3, touch.dy)
      ..setImageSampler(0, image);

    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant _LiquidGlassPainter old) =>
      old.touch != touch || old.image != image || old.shader != shader;
}
