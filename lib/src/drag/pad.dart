part of '../joystick.dart';

/// Specifies the area of the pad to allow the stick/ball to drag.
class DragPad extends StatelessWidget {
  final double size;
  final Color color;

  const DragPad({
    required this.size,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
