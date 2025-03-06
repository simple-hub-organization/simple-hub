import 'package:site/presentation/integrations_page/device_card.dart';
import 'package:site/presentation/shared_widgets/bottom_navigation_menu/bottom_navigation_menu.dart';
import 'package:flutter/material.dart';

/// Integrations page content for the mobile and tablet screen size
class IntegrationsPageContentMobileTablet extends StatelessWidget {
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
                    'Supported Vendors',
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
                decoration: BoxDecoration(
                  color: Colors.black38,
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                    left: BorderSide(
                      color: Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                    right: BorderSide(
                      color: Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 2),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width - 10,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: true,
                    childAspectRatio: (MediaQuery.of(context).size.width) /
                        (MediaQuery.of(context).size.height / 2.5),
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    crossAxisCount: 1,
                    children: const [
                      DeviceCard(
                        'Google',
                        'https://i.ibb.co/Wsqst7Y/google-logo.png',
                        'https://www.google.com/chromecast/built-in/',
                      ),
                      DeviceCard(
                        'HP',
                        'https://i.ibb.co/8xxY6Bb/hp-logo.png',
                        'https://www.hp.com/us-en/home.html',
                      ),
                      DeviceCard(
                        'Xiaomi Yeelight',
                        'https://i.ibb.co/C20VvvB/yeelight-logo.png',
                        'https://www.yeelight.com',
                      ),
                      DeviceCard(
                        'Lifx',
                        'https://i.ibb.co/2qN6yJW/lifx-logo.png',
                        'https://www.lifx.com/',
                      ),
                      DeviceCard(
                        'Switcher',
                        'https://i.ibb.co/q9psvjY/switcher-logo.png',
                        'https://switcher.co.il',
                      ),
                      DeviceCard(
                        'MQTT',
                        'https://i.ibb.co/hfRhB0Q/mqtt-logo.png',
                        'https://mqtt.org',
                      ),
                      DeviceCard(
                        'Tasmota',
                        'https://i.ibb.co/XZLGCRd/Tasmota-logo.png',
                        'https://tasmota.github.io',
                      ),
                      DeviceCard(
                        'ESPHome',
                        'https://i.ibb.co/W2YG23s/ESPHome-logo.png',
                        'https://esphome.io',
                      ),
                      DeviceCard(
                        'Shelly',
                        'https://i.ibb.co/yqBDqkD/shelly-logo.png',
                        'https://shelly.cloud/',
                      ),
                      DeviceCard(
                        'Node-RED',
                        'https://i.ibb.co/THRX9kq/node-RED-logo.png',
                        'https://nodered.org/',
                      ),
                    ],
                  ),
                ),
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
