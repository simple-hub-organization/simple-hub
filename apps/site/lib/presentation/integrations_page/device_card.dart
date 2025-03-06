import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Show individual card for with name and image and link to open when pressed
class DeviceCard extends StatelessWidget {
  const DeviceCard(this.deviceName, this.imageUrl, this.urlOpenOnPressed);

  /// Url image link for the card to show
  final String imageUrl;

  /// Name of the device/card that will be displayed
  final String deviceName;

  /// Url that will be opened when the card is pressed
  final String urlOpenOnPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        launchUrlString(urlOpenOnPressed);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            height: 80,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.scaleDown,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            deviceName,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
