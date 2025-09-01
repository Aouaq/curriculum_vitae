import 'dart:math';
import 'package:flutter/material.dart';

class MatrixRain extends StatefulWidget {
  final int columnCount; // number of "streams" of numbers
  final Color color;
  const MatrixRain({super.key, this.columnCount = 20, this.color = Colors.green});

  @override
  State<MatrixRain> createState() => _MatrixRainState();
}

class _MatrixRainState extends State<MatrixRain> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  late List<double> _yPositions;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();

    _yPositions = List.generate(widget.columnCount, (_) => _random.nextDouble());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columnWidth = width / widget.columnCount;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: _MatrixPainter(
            yPositions: _yPositions,
            progress: _controller.value,
            columnWidth: columnWidth,
            color: widget.color,
          ),
        );
      },
    );
  }
}

class _MatrixPainter extends CustomPainter {
  final List<double> yPositions;
  final double progress;
  final double columnWidth;
  final Color color;
  final Random _random = Random();

  _MatrixPainter({
    required this.yPositions,
    required this.progress,
    required this.columnWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final textStyle = TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (int i = 0; i < yPositions.length; i++) {
      final x = i * columnWidth;
      final baseY = (size.height + 50) * ((yPositions[i] + progress) % 1);

      // draw a stream of numbers
      for (int j = 0; j < 15; j++) {
        final y = baseY - j * 18;
        if (y < 0) continue;

        final text = ( _random.nextBool() ? '0' : '1');
        textPainter.text = TextSpan(text: text, style: textStyle.copyWith(
          color: j == 0 ? Colors.white : color.withOpacity(1 - j * 0.07),
        ));
        textPainter.layout();
        textPainter.paint(canvas, Offset(x, y));
      }
    }
  }

  @override
  bool shouldRepaint(_MatrixPainter oldDelegate) => true;
}
