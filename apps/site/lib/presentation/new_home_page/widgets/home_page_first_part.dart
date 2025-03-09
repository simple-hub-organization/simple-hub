import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:site/my_singleton.dart';
import 'package:site/presentation/home_page/widgets/supported_vendors_tile_grid_view.dart';
import 'package:site/presentation/new_home_page/widgets/border_text_with_shadow.dart';
import 'package:site/presentation/route_names.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePageFirstPart extends StatelessWidget {
  final YoutubePlayerController _controller = YoutubePlayerController();

  final List<String> companysLogs = [
    'https://i.ibb.co/Wsqst7Y/google-logo.png',
    'https://i.ibb.co/yqBDqkD/shelly-logo.png',
    'https://i.ibb.co/C20VvvB/yeelight-logo.png',
    'https://i.ibb.co/hfRhB0Q/mqtt-logo.png',
    'https://i.ibb.co/THRX9kq/node-RED-logo.png',
    'https://i.ibb.co/W2YG23s/ESPHome-logo.png',
    'https://i.ibb.co/q9psvjY/switcher-logo.png',
    'https://i.ibb.co/XZLGCRd/Tasmota-logo.png',
    'https://i.ibb.co/2qN6yJW/lifx-logo.png',
    'https://i.ibb.co/8xxY6Bb/hp-logo.png',
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    _controller.loadVideoById(
      startSeconds: 120,
      videoId: 'o5owbiQahnY',
    );

    return Stack(
      children: [
        SizedBox.expand(
          child: CachedNetworkImage(
            imageUrl:
                // 'https://wallpaperaccess.com/full/3644270.jpg'
                // 'https://cdn.vox-cdn.com/thumbor/qCHcHkgH7TAc2SCOTQLj9UkQLQo=/0x0:1200x739/2420x1613/filters:focal(504x274:696x466)/cdn.vox-cdn.com/uploads/chorus_image/image/56981041/slack_imgs.0.jpg'
                // 'https://cdn.vox-cdn.com/thumbor/p8mU0Z3el-wDtvjMF62Wz4hCets=/0x0:1499x1000/1200x800/filters:focal(631x381:869x619)/cdn.vox-cdn.com/uploads/chorus_image/image/56785169/LIFX_Mini_LED_Lighting_Image.0.jpg'

                // 'https://images.macrumors.com/t/akS-rfKtypWuIFOGfmWE2nZz-ac=/1600x/http://images.macrumors.com/article-new/2017/11/lifxzlightstrips.jpg'
                // 'https://www.self-build.co.uk/wp-content/uploads/2018/01/Loxone-lighting-system.png'
                'https://i.ibb.co/mFqb1DV/home-page-section-1-background.jpg'
            // 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.loxone.com%2Fenus%2Fwp-content%2Fuploads%2Fsites%2F13%2F2016%2F10%2FPH_Loxone-Showhome-Living-Room.jpg&f=1&nofb=1&ipt=08ed13561bee015a97d1a766368a25a8ee5251f30fb3f7377d409c9008e4cf73&ipo=images'
            // 'https://promotion-static.tuyaus.com/static/139914518422863872.jpg'
// 'https://9to5toys.com/wp-content/uploads/sites/5/2018/09/lifx-tile-starter-kit.jpg'
            ,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 3,
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(right: 10, left: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          height: screenSize.height / 2.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: <Widget>[
                                  Text(
                                    'smart home',
                                    style: TextStyle(
                                      fontSize: 65,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 2.5
                                        ..color = HexColor('#000000'),
                                    ),
                                  ),
                                  // Solid text as fill.
                                  const Text(
                                    'smart home',
                                    style: TextStyle(
                                      fontSize: 65,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              const BorderTextWithShadow(
                                "If you're a person who values his time or freedom\nWe have the product for you.\n",
                              ),
                              const BorderTextWithShadow(
                                'It automatically creates personalized automations to improved your performance in your daily activities.\n',
                              ),
                              const BorderTextWithShadow(
                                'By setting a purpose for each area in the home CBJ will create the best automations to suite your needs.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        width: screenSize.width / 2,
                        height: screenSize.height / 2.3,
                        child: YoutubePlayerControllerProvider(
                          controller: _controller,
                          child: YoutubePlayer(controller: _controller),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    flex: 18,
                    child: SizedBox(),
                  ),
                  Flexible(
                    flex: 16,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero,
                        ),
                      ),
                      onPressed: () {
                        if (MySingleton.getCurrentPageName !=
                            integrationsRoute) {
                          Navigator.pushNamed(context, integrationsRoute);
                        } else {
                          Navigator.pushReplacementNamed(
                            context,
                            integrationsRoute,
                          );
                        }
                      },
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 2.0,
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200
                                  .withAlpha((0.5 * 255).toInt()),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: const BorderTextWithShadow(
                                        'Supported Vendors',
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top: 20,
                                        ),
                                        height: 60,
                                        width: screenSize.width / 1.1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[0],
                                            ),
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[1],
                                            ),
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[2],
                                              imageBackgroundColor: Colors.red,
                                            ),
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[3],
                                            ),
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[4],
                                              imageBackgroundColor:
                                                  HexColor('#8F0000'),
                                            ),
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[5],
                                            ),
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[6],
                                            ),
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[7],
                                            ),
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[8],
                                            ),
                                            SupportedVendorsTileGridViewNetworkImage(
                                              companysLogs[9],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
