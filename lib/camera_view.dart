import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;
  CameraApp({Key key, @required this.cameras}) : super(key: key);
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      children: <Widget>[
        Center(
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: CameraPreview(controller),
          ),
        ),
        Positioned(
          bottom: 10.0,
          child: RaisedButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Capture!'),
                ),
              );
            },
            child: Text('Capture!'),
          ),
        ),
      ],
    );
  }
}
