
import 'package:flutter/material.dart';

class CircleNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double notchRadius = 36;
    const double buttonRadius = 28;
    const double cornerRadius = 36;

    final double centerX = size.width - buttonRadius;
    const double centerY = 28;

    final cardPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          const Radius.circular(cornerRadius),
        ),
      );

    final notchPath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(centerX, centerY),
          radius: notchRadius,
        ),
      );

    return Path.combine(
      PathOperation.difference,
      cardPath,
      notchPath,
    );
  }

  @override
  bool shouldReclip(
    covariant CustomClipper<Path> oldClipper,
  ) {
    return false;
  }
}
