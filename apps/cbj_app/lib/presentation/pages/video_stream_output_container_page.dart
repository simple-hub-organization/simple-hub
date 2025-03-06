import 'package:auto_route/auto_route.dart';
import 'package:cbj_smart_device_flutter/presentation/client/image_stream_page.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class VideoStreamOutputContainerPage extends StatelessWidget {
  const VideoStreamOutputContainerPage({required this.streamAddress});

  final String streamAddress;

  @override
  Widget build(BuildContext context) {
    return ImageStreamPage(serverIp: streamAddress);
  }
}
