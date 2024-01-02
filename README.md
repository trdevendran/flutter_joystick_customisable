# flutter_joystick_customisable

A Flutter plugin for joystick with customisable options.

## Getting Started

```dart
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
                      dragCallback: (DragInfo? coordinates) {
                        setState(() {
                          _dragInfo = coordinates;
                        });
                      },
                    )
                  ],
                ))),
      ),
    );
  }
}

```

See the [Demo](https://github.com/trdevendran/flutter_joystick_customisable/blob/master/example/lib/main.dart) for more detailed sample project.

### Feel free to contribute to this package!! 🙇‍♂️
Always happy if anyone wants to help to improve this package!

### If you need any features
Please open an issue so that we can discuss your feature request 🙏
