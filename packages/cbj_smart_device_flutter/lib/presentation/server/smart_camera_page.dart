import 'package:cbj_smart_device_flutter/presentation/server/camera_widget.dart';
import 'package:flutter/material.dart';

class SmartCameraPage extends StatelessWidget {
  const SmartCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Camera'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CameraExampleHome(),
          ),
        ],
      ),
    );
  }
}
