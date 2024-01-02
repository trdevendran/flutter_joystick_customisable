import 'dart:async';

import 'package:flutter/material.dart';

import 'drag/callback.dart';
import 'drag/info.dart';
import 'offset_handler.dart';
import 'triangle_shape.dart';

part 'stick_ball.dart';

part 'stick_controller.dart';

part 'drag/pad.dart';

/// Joystick widget
class Joystick extends StatefulWidget {
  /// Size of the stick/ball to occupy the screen with the rest of the controls
  final double stickSize;

  /// Frequency of calling [dragCallback] from the moment the stick is dragged.
  final Duration timeFrequency;

  /// Widget that renders joystick base, by default [DragPad].
  final Widget? draggableContainer;

  /// Specifies color of the [DragPad].
  final Color dragPadColor;

  /// Controller allows to control joystick events outside the widget.
  final StickController? stickController;

  /// Callback, which is called when the stick starts dragging.
  final Function? onDragStart;

  /// Callback, which is called when the stick released.
  final Function? onDragEnd;

  /// Callback, which is called with [timeFrequency] when the stick is dragged.
  final StickDragCallback dragCallback;

  const Joystick({
    super.key,
    this.draggableContainer,
    required this.dragCallback,
    this.stickController,
    this.onDragStart,
    this.onDragEnd,
    this.dragPadColor = Colors.purple,

    /// Frequency is by default 150 milliseconds.
    this.timeFrequency = const Duration(milliseconds: 150),

    /// Size of the stick/ball is by default 100 pixel.
    this.stickSize = 100,
  });

  @override
  State<Joystick> createState() => _JoystickState();
}

class _JoystickState extends State<Joystick> {
  final GlobalKey _baseKey = GlobalKey();

  Offset _stickOffset = Offset.zero;
  Timer? _callbackTimer;
  Offset _startDragStickPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    widget.stickController?.onStickDragStart =
        (globalPosition) => _stickDragStart(globalPosition);
    widget.stickController?.onStickDragUpdate =
        (globalPosition) => _stickDragUpdate(globalPosition);
    widget.stickController?.onStickDragEnd = () => _stickDragEnd();
  }

  @override
  Widget build(BuildContext context) {
    /// Calculate sizes of the required widgets to make it dynamic size
    var draggableContainerSize = widget.stickSize * 2;
    var borderContainerSize = draggableContainerSize * 1.03;
    var spaceBetweenArrows = draggableContainerSize * 1.55;

    return Stack(alignment: Alignment.center, children: [
      IgnorePointer(
          child: Container(
        width: borderContainerSize,
        height: borderContainerSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(draggableContainerSize / 2),
            border: Border.all(color: Colors.white, width: 4)),
      )),
      SizedBox(
          width: spaceBetweenArrows,
          height: spaceBetweenArrows,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TriangleShape(
                direction: Direction.left,
              ),
              TriangleShape(
                direction: Direction.right,
              )
            ],
          )),
      SizedBox(
          width: spaceBetweenArrows,
          height: spaceBetweenArrows,
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TriangleShape(),
                TriangleShape(
                  direction: Direction.bottom,
                )
              ])
          // )
          ),
      Stack(alignment: Alignment(_stickOffset.dx, _stickOffset.dy), children: [
        Container(
          key: _baseKey,
          child: widget.draggableContainer ??
              DragPad(
                  size: draggableContainerSize,
                  color: widget.dragPadColor),
        ),
        GestureDetector(
            onPanStart: (details) => _stickDragStart(details.globalPosition),
            onPanUpdate: (details) => _stickDragUpdate(details.globalPosition),
            onPanEnd: (details) => _stickDragEnd(),
            child: StickBall(size: widget.stickSize)),
      ])
    ]);
  }

  void _stickDragStart(Offset globalPosition) {
    _runCallback();
    _startDragStickPosition = globalPosition;
    widget.onDragStart?.call();
  }

  void _stickDragUpdate(Offset globalPosition) {
    final baseRenderBox =
        _baseKey.currentContext!.findRenderObject()! as RenderBox;

    final stickOffset = StickOffsetHandler.calculate(
      startDragStickPosition: _startDragStickPosition,
      currentDragStickPosition: globalPosition,
      baseSize: baseRenderBox.size,
    );

    setState(() {
      _stickOffset = stickOffset;
    });
  }

  void _stickDragEnd() {
    setState(() {
      _stickOffset = Offset.zero;
    });

    _callbackTimer?.cancel();
    //send zero offset when the stick is released
    widget.dragCallback(DragInfo(_stickOffset.dx, _stickOffset.dy));
    _startDragStickPosition = Offset.zero;
    widget.onDragEnd?.call();
  }

  void _runCallback() {
    _callbackTimer = Timer.periodic(widget.timeFrequency, (timer) {
      widget.dragCallback(DragInfo(_stickOffset.dx, _stickOffset.dy));
    });
  }

  @override
  void dispose() {
    _callbackTimer?.cancel();
    super.dispose();
  }
}
