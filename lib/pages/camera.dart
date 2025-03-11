import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  List<CameraDescription> cameras;

  Camera(this.cameras);

  @override
  CameraState createState() {
    return CameraState();
  }
}

class CameraState extends State<Camera> {
  late CameraController controller;

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
    if (controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
}
