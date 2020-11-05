import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_flutter/constant/Constant.dart';

enum CircleAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class QuarterCirclePainter extends CustomPainter {
  final CircleAlignment circleAlignment;
  final Color color;

  const QuarterCirclePainter({this.circleAlignment, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.height, size.width - 80);
    var rect = Offset.zero & size;
    final offset = circleAlignment == CircleAlignment.topLeft
        ? Offset(.0, .0)
        : circleAlignment == CircleAlignment.topRight
            ? Offset(size.width, 5)
            : circleAlignment == CircleAlignment.bottomLeft
                ? Offset(.0, size.height + 10)
                : Offset(size.width, size.height);
    canvas.drawCircle(
        offset,
        radius,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              colorPrimary,
              colorSemiPrimary,
            ],
          ).createShader(rect));
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return color == oldDelegate.color &&
        circleAlignment == oldDelegate.circleAlignment;
  }
}
