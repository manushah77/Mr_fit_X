import 'dart:math';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  const CustomProgressIndicator({
    required this.progress,
    this.strokeWidth = 12.0,
    this.backgroundColor = Colors.black12,
    this.progressColor = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomProgressIndicatorPainter(
        progress: progress,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        progressColor: progressColor,
      ),
      child: Center(
        child: Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white30,width: 8,),
            shape: BoxShape.circle,
            color: Color(0xffc6811d),
          ),
          child:Center(
            child: Image.asset(
              'assets/images/glass.png',
              scale: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomProgressIndicatorPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  _CustomProgressIndicatorPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 1.4, size.height / 1.4) - (strokeWidth / 1.4);

    // Draw background
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final progressAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      progressAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}