import 'dart:math';

import 'package:flutter/material.dart';

/// Handle the offsets of the stick based on the stick drag start and current stick position.
class StickOffsetHandler {
  const StickOffsetHandler();

  static Offset calculate({
    required Offset startDragStickPosition,
    required Offset currentDragStickPosition,
    required Size baseSize,
  }) {
    double x = currentDragStickPosition.dx - startDragStickPosition.dx;
    double y = currentDragStickPosition.dy - startDragStickPosition.dy;
    final radius = baseSize.width / 2;

    final isPointInCircle = x * x + y * y < radius * radius;

    if (!isPointInCircle) {
      final multiply = sqrt(radius * radius / (y * y + x * x));
      x *= multiply;
      y *= multiply;
    }

    final xOffset = x / radius;
    final yOffset = y / radius;

    return Offset(xOffset, yOffset);
  }
}
