/// Contains the stick offset from the center of the base.
class DragInfo {
  /// x - the stick offset in the horizontal direction. Can be from -1.0 to +1.0.
  final double x;

  /// y - the stick offset in the vertical direction. Can be from -1.0 to +1.0.
  final double y;

  DragInfo(this.x, this.y);
}
