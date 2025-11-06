import 'dart:math';
import 'package:curriculum_vitae/utils/colors.dart';
import 'package:flutter/material.dart';

class HoverRotatingDoubleHexagon extends StatefulWidget {
  final double size;
  final Color outerColor;
  final Color innerColor;

  const HoverRotatingDoubleHexagon({
    super.key,
    this.size = 180,
    this.outerColor = AppColors.secondary,
    this.innerColor = AppColors.primary,
  });

  @override
  State<HoverRotatingDoubleHexagon> createState() =>
      _HoverRotatingDoubleHexagonState();
}

class _HoverRotatingDoubleHexagonState
    extends State<HoverRotatingDoubleHexagon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final direction = _isHovered ? -1 : 1;
            return Container(
              decoration: BoxDecoration(
                
              ),
              child: Stack(
                alignment: Alignment.center,
                
                children: [
                  // Outer hexagon
                  Transform.rotate(
                    angle: direction * _controller.value * 2 * pi,
                    child: CustomPaint(
                      size: Size(widget.size, widget.size),
                      painter: _HexagonPainter(color: widget.outerColor),
              
                    ),
                  ),
                  // Inner hexagon
                  Transform.rotate(
                    angle: -direction * _controller.value * 2 * pi,
                    child: CustomPaint(
                      size: Size(widget.size * 0.65, widget.size * 0.65),
                      painter: _HexagonPainter(color: widget.innerColor),
                    ),
                  ),
                  // Avatar in the middle
                  CircleAvatar(
                    radius: widget.size * 0.22,
                    backgroundColor: Colors.grey[900],
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  final Color color;
  _HexagonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    for (int i = 0; i < 6; i++) {
      final angle = (pi / 3) * i - pi / 2;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
