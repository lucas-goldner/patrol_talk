import 'dart:math';

import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';

class GraphData {
  GraphData({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final int value;
  final Color color;
}

class AnimatedGraphWidget extends StatelessWidget {
  const AnimatedGraphWidget({
    required this.data,
    this.showStats = true,
    this.backgroundColor = const Color(0xFF1A1A2E),
    this.gridColor,
    super.key,
  });

  final List<GraphData> data;
  final bool showStats;
  final Color backgroundColor;
  final Color? gridColor;

  int get _maxValue => data.isEmpty
      ? 1
      : data.map((e) => e.value).reduce((a, b) => max(a, b));

  int get _totalValue => data.fold(0, (sum, item) => sum + item.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.blue[400]?.withValues(alpha: 0.5) ?? Colors.blue,
        ),
      ),
      child: Stack(
        children: [
          // Grid background
          CustomPaint(
            size: Size.infinite,
            painter: GridPainter(
              color: gridColor ?? Colors.blue[900]!.withValues(alpha: 0.5),
            ),
          ),
          // Graph content
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stats panel
                if (showStats) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F3460).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.blue[400]?.withValues(alpha: 0.5) ??
                            Colors.blue,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _StatItem(
                          label: 'Total',
                          value: _totalValue.toString(),
                          icon: Icons.people,
                        ),
                        const SizedBox(width: 24),
                        _StatItem(
                          label: 'Max',
                          value: _maxValue.toString(),
                          icon: Icons.arrow_upward_rounded,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
                // Graph
                Expanded(
                  child: Row(
                    children: [
                      // Y-axis
                      Container(
                        width: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue[400] ?? Colors.blue,
                              Colors.blue[400]?.withValues(alpha: 0.5) ??
                                  Colors.blue.withValues(alpha: 0.5),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Bars
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < data.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: AnimatedTo.spring(
                                  globalKey: GlobalObjectKey('bar_$i'),
                                  child: _Bar(
                                    label: data[i].label,
                                    value: data[i].value,
                                    maxValue: _maxValue,
                                    color: data[i].color,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    required this.label,
    required this.value,
    required this.maxValue,
    required this.color,
  });

  final String label;
  final int value;
  final int maxValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.blue[300] ?? Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = maxValue > 0
                ? (constraints.maxWidth * value / maxValue)
                    .clamp(0.0, constraints.maxWidth)
                : 0.0;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 40,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withValues(alpha: 0.8),
                    color,
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  value.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue[400]?.withValues(alpha: 0.5) ?? Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.blue[300] ?? Colors.blue,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.blue[300] ?? Colors.blue,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  GridPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const spacing = 30;
    for (var i = 0; i < size.width; i += spacing) {
      canvas.drawLine(
        Offset(i.toDouble(), 0),
        Offset(i.toDouble(), size.height),
        paint,
      );
    }
    for (var i = 0; i < size.height; i += spacing) {
      canvas.drawLine(
        Offset(0, i.toDouble()),
        Offset(size.width, i.toDouble()),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}