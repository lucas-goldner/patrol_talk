import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class ChoyanShaderWidget extends StatefulWidget {
  const ChoyanShaderWidget({
    super.key,
    this.width = 300,
    this.height = 300,
    this.autoAnimate = true,
  });

  final double width;
  final double height;
  final bool autoAnimate;

  @override
  State<ChoyanShaderWidget> createState() => _ChoyanShaderWidgetState();
}

class _ChoyanShaderWidgetState extends State<ChoyanShaderWidget>
    with SingleTickerProviderStateMixin {
  ui.FragmentShader? _shader;
  ui.Image? _image;
  late AnimationController _animationController;
  late Animation<double> _timeAnimation;
  Offset _touchPosition = Offset.zero;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    _loadShaderAndImage();
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );
    _timeAnimation = Tween<double>(
      begin: 0,
      end: 8,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    if (widget.autoAnimate) {
      _animationController.repeat();
    }
  }

  Future<void> _loadShaderAndImage() async {
    try {
      // Load the Choyan shader
      final program = await ui.FragmentProgram.fromAsset(
        'assets/shaders/liquid_shader_choyan.frag',
      );
      _shader = program.fragmentShader();

      // Load a background image
      final data = await rootBundle.load('assets/images/background.webp');
      _image = await decodeImageFromList(data.buffer.asUint8List());

      setState(() {
        _isLoaded = true;
        _touchPosition = Offset(widget.width / 2, widget.height / 2);
      });
    } on Exception catch (e) {
      debugPrint('Error loading Choyan shader or image: $e');
    }
  }

  void _updateTouchPosition(Offset position) {
    setState(() {
      _touchPosition = position;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded || _shader == null || _image == null) {
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(
                'Loading Choyan Shader...',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GestureDetector(
          onTapDown: (details) => _updateTouchPosition(details.localPosition),
          onPanUpdate: (details) => _updateTouchPosition(details.localPosition),
          child: AnimatedBuilder(
            animation: _timeAnimation,
            builder: (context, child) {
              return CustomPaint(
                size: Size(widget.width, widget.height),
                painter: _ChoyanShaderPainter(
                  shader: _shader!,
                  image: _image!,
                  touchPosition: _touchPosition,
                  time: _timeAnimation.value,
                  size: Size(widget.width, widget.height),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ChoyanShaderPainter extends CustomPainter {
  _ChoyanShaderPainter({
    required this.shader,
    required this.image,
    required this.touchPosition,
    required this.time,
    required this.size,
  });

  final ui.FragmentShader shader;
  final ui.Image image;
  final Offset touchPosition;
  final double time;
  final Size size;

  @override
  void paint(Canvas canvas, Size canvasSize) {
    // Set shader uniforms for Choyan shader
    shader
      ..setFloat(0, size.width) // resolution.x
      ..setFloat(1, size.height) // resolution.y
      ..setFloat(2, time) // iTime
      ..setImageSampler(0, image);

    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant _ChoyanShaderPainter old) =>
      old.touchPosition != touchPosition ||
      old.time != time ||
      old.image != image ||
      old.shader != shader;
}
