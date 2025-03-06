import 'dart:convert';
import 'dart:typed_data';
import "dart:ui" as ui;

import 'package:cbj_smart_device/application/usecases/smart_server_u/smart_server_u.dart';
import 'package:cbj_smart_device/utils.dart';
import 'package:cbj_smart_device_flutter/presentation/client/smart_device_client.dart';
import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class ImageStreamPage extends StatefulWidget {
  const ImageStreamPage({
    super.key,
    required this.serverIp,
  });

  final String serverIp;

  @override
  State<ImageStreamPage> createState() => _ImageStreamPageState();
}

class _ImageStreamPageState extends State<ImageStreamPage> {
  SmartDeviceClient smartDeviceClient = SmartDeviceClient();
  ui.Image? image;

  Future videoStream() async {
    await smartDeviceClient.createStreamWithSmartDevice(
        widget.serverIp, CbjSmartDeviceServerU.port);

    logger.i('Listen to Stream');

    ClientRequestsToSmartDeviceServer.steam.listen((event) {
      logger.i('Element from stream $event');
    });

    SmartDeviceServerRequestsToSmartDeviceClient.steam.stream
        .listen((value) async {
      List<int> bytes = json
          .decode(value.allRemoteCommands.smartDeviceInfo.stateMassage)
          .cast<int>();
      Uint8List ulist = Uint8List.fromList(bytes.toList());

      ui.Codec codec = await ui.instantiateImageCodec(ulist);
      ui.FrameInfo frame = await codec.getNextFrame();
      if (!mounted) {
        return;
      }
      setState(() {
        image = frame.image;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    videoStream();
  }

  @override
  void dispose() {
    smartDeviceClient.dispose();
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Stream'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            Expanded(
              child: Center(
                child: RawImage(
                  image: image,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
