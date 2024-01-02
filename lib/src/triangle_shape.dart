import 'package:flutter/material.dart';

enum Direction { left, right, top, bottom }

class TriangleShape extends StatelessWidget {
  final Direction direction;

  const TriangleShape({super.key, this.direction = Direction.top});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: CustomPaint(
        painter: _TrianglePainter(direction),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Direction direction;

  _TrianglePainter(this.direction);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Define the triangle vertices
    double topX;
    double topY;

    double bottomLeftX;
    double bottomLeftY;

    double bottomRightX;
    double bottomRightY;

    switch (direction) {
      case Direction.left:
        topX = 0.0;
        topY = size.height / 2;

        bottomLeftX = size.width;
        bottomLeftY = size.height;

        bottomRightX = size.width;
        bottomRightY = 0.0;
        break;
      case Direction.right:
        topX = size.width;
        topY = size.height / 2;

        bottomLeftX = 0.0;
        bottomLeftY = 0.0;

        bottomRightX = 0.0;
        bottomRightY = size.height;
        break;
      case Direction.bottom:
        topX = size.width / 2;
        topY = size.height;

        bottomLeftX = 0.0;
        bottomLeftY = 0.0;

        bottomRightX = size.width;
        bottomRightY = 0.0;
        break;
      default:
        topX = size.width / 2;
        topY = 0.0;

        bottomLeftX = 0.0;
        bottomLeftY = size.height;

        bottomRightX = size.width;
        bottomRightY = size.height;
    }
    // Move to the top vertex
    path.moveTo(topX, topY);

    // Draw the left side
    path.lineTo(bottomLeftX, bottomLeftY);

    // Draw the bottom side
    path.lineTo(bottomRightX, bottomRightY);

    // Draw the right side
    path.lineTo(topX, topY);

    // Close the path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
