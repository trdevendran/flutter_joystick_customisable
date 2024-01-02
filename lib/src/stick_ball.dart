part of 'joystick.dart';

/// Draggable ball of the Joystick
class StickBall extends StatelessWidget {
  final double size;
  final List<Color> colors;

  const StickBall({
    required this.size,
    this.colors = const [
      Colors.lightBlue,
      Colors.blue,
    ],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 6,
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
        gradient: RadialGradient(
          colors: colors,
        ),
      ),
    );
  }
}
