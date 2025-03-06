import 'package:cybear_jinni_site/presentation/integrations_page/device_card.dart';
import 'package:cybear_jinni_site/presentation/shared_widgets/bottom_navigation_menu/bottom_navigation_menu.dart';
import 'package:flutter/material.dart';

/// Integrations page content for the desktop
class IntegrationsPageContentDesktop extends StatelessWidget {
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
                padding: const EdgeInsets.only(bottom: 20),
                height: 180,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text(
                    'Supported Vendors',
                    style: TextStyle(
                      fontSize: 50,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
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
                padding: const EdgeInsets.symmetric(vertical: 100),
                width: MediaQuery.of(context).size.width - 200,
                child: Container(
                  margin: const EdgeInsets.only(left: 300, right: 300),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: true,
                    childAspectRatio: (MediaQuery.of(context).size.width) /
                        (MediaQuery.of(context).size.height / 0.5),
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    crossAxisCount: 3,
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
