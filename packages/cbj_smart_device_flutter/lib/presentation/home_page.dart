import 'package:cbj_smart_device_flutter/presentation/client/image_stream_page.dart';
import 'package:cbj_smart_device_flutter/presentation/server/smart_camera_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SmartCameraPage(),
                ),
              );
            },
            child: const Text('Smart Camera'),
          ),
          const SizedBox(height: 20, width: double.infinity),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ImageStreamPage(serverIp: '192.168.31.75'),
                ),
              );
            },
            child: const Text('Video Player'),
          ),
        ],
      ),
    );
  }
}
