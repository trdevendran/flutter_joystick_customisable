import 'package:flutter/material.dart';
import 'package:flutter_joystick_customisable/flutter_joystick_customisable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DragInfo? _dragInfo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
            color: Colors.black,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "x: ${_dragInfo?.x ?? 0.0}, y: ${_dragInfo?.y ?? 0.0}",
                  style: const TextStyle(color: Colors.white),
                ),
                Joystick(
                    stickSize: 50,
                    dragPadColor: Colors.red,
                    onDragStart: () {
                      // You can use this callback for your business case when the stick/ball start dragging
                    },
                    onDragEnd: () {
                      // You can use this callback for your business case when the stick/ball stop dragging
                    },
                    dragCallback: (DragInfo? dragInfo) {
                      setState(() {
                        _dragInfo = dragInfo;
                      });
                    })
              ],
            ))),
      ),
    );
  }
}
