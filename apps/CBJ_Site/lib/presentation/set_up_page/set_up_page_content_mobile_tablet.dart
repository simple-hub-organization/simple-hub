import 'package:cached_network_image/cached_network_image.dart';
import 'package:cybear_jinni_site/presentation/shared_widgets/bottom_navigation_menu/bottom_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Set Up page content for the mobile and tablet screen size
class SetUpPageContentMobileTablet extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      thickness: 13,
      controller: _scrollController,
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: Colors.black26,
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 30),
                height: 150,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text(
                    'Set Up CyBear Jinni',
                    style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: 'First step: ',
                              style: TextStyle(fontSize: 30),
                            ),
                            TextSpan(
                              text: 'Setting Up a Hub',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'RaspberryPi Hub Setup',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                                children: const [
                                  TextSpan(
                                    text: '1. ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: 'Download the CyBear Jinni '
                                        'RaspberryPi image.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 200,
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                launchUrlString(
                                  'https://drive.google.com/u/0/uc?id=1aC6RlNDmD6JtUGO-qc9CnyitL2PFk5cM&export=download',
                                );
                              },
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.ibb.co/1RFBWkn/raspberry-logo.png',
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              children: const [
                                TextSpan(
                                  text: '2. ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: 'Flash the OS images (.iso file) to'
                                      ' the SD card using iso flashing '
                                      'program like balenaEtcher.',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 200,
                            child: InkWell(
                              onTap: () {
                                launchUrlString(
                                  'https://www.balena.io/etcher/',
                                );
                              },
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.ibb.co/mGwbmXN/balena-Etcher.png',
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                                children: const [
                                  TextSpan(
                                    text: '3. ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: 'Connect the RaspberryPi with an '
                                        'internet cable and power it on.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 50),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                    thickness: 1,
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: const Text(
                                    'Choose one of the options',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Linux Hub Setup',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              children: const [
                                TextSpan(
                                  text: '1. ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: 'Install an MQTT broker like the'
                                      ' mosquitto snap.',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              launchUrlString('https://snapcraft.io/mosquitto');
                            },
                            child: SizedBox(
                              width: 200,
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.ibb.co/RDPqFrx/mosquitto.jpg',
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                                children: const [
                                  TextSpan(
                                    text: '2. ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: 'Install the cbj-hub snap.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 200,
                            child: InkWell(
                              onTap: () {
                                launchUrlString('https://snapcraft.io/cbj-hub');
                              },
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.ibb.co/gJN2Wq1/snap-store-logo-dark.png',
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                          children: const [
                            TextSpan(
                              text: 'Second step: ',
                              style: TextStyle(fontSize: 30),
                            ),
                            TextSpan(
                              text: 'Setting Up the App',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'App Setup',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'Install the app on your preferred '
                                        'platform.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: InkWell(
                              onTap: () {
                                launchUrlString(
                                  'https://play.google.com/store/apps/details?id=com.cybear_jinni.smart_home',
                                );
                              },
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.ibb.co/st5DHMv/en-badge-web-generic.png',
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 200,
                            child: InkWell(
                              onTap: () {
                                launchUrlString(
                                  'https://snapcraft.io/cybear-jinni',
                                );
                              },
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.ibb.co/gJN2Wq1/snap-store-logo-dark.png',
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              BottomNavigationMenu(),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
