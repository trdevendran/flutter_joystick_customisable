# flutter_joystick_customisable

A Flutter plugin for joystick with customisable options with custom properties as below,

```dart
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
    }
)
```

<img src="https://github.com/trdevendran/flutter_joystick_customisable/assets/12223179/371b06e1-aed5-4249-a9da-c9f70d7d70a4" alt="drawing" style="width:380px;height:780px" />

You can enable the button controls at out side of the drag pad and with default properties as below,

```dart
Joystick(dragCallback: (DragInfo? dragInfo) {
    setState(() {
      _dragInfo = dragInfo;
    });
  },
    enableButtonControls: true,
)
```
[Screen_recording_20240102_074118.webm](https://github.com/trdevendran/flutter_joystick_customisable/assets/12223179/d5c4f007-63cf-430b-826c-74e214527eb2)

## Getting Started

Joystick is stateful widget to display the UI of the customisable joystick which has the below primary properties to handle it effectively.

|     Properties     |        Type         | Description                                                                                                                                                                  |
|:------------------:|:-------------------:|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     stickSize      |       double        | Size of the stick/ball to occupy the screen with the rest of the controls                                                                                                    |
|   timeFrequency    |      Duration       | Frequency of calling `dragCallback` from the moment the stick is dragged.                                                                                                    |
| draggableContainer |       Widget        | Widget that renders joystick base, by default `DragPad` of this library will take care of this part and the size of this widget will be varied based on the stick/ball size. |
|    dragPadColor    |        Color        | Specifies the color of the `DragPad`                                                                                                                                         |
|  stickController   |  `StickController`  | Controller allows to control joystick events outside the widget.                                                                                                             |
|    onDragStart     |      Function       | Callback, which is called when the stick starts dragging.                                                                                                                    |
|     onDragEnd      |      Function       | Callback, which is called when the stick released.                                                                                                                           |
|    dragCallback    | `StickDragCallback` | Callback, which is called with `timeFrequency` when the stick is dragged.                                                                                                    |
|    enableButtonControls    | bool | Enable the button controls at out side of the drag pad.                                                                                                  |

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
```

See the [Demo](https://github.com/trdevendran/flutter_joystick_customisable/blob/master/example/lib/main.dart) for more detailed sample project.

### Feel free to contribute to this package!! 🙇‍♂️
Always happy if anyone wants to help to improve this package!

### If you need any features
Please open an issue so that we can discuss your feature request 🙏
