import 'package:cached_network_image/cached_network_image.dart';
import 'package:site/presentation/home_page/widgets/easy_to_set_up_benefit_block.dart';
import 'package:site/presentation/home_page/widgets/easy_to_use_benefit_block.dart';
import 'package:site/presentation/home_page/widgets/privacy_and_open_source_benefit_block.dart';
import 'package:site/presentation/home_page/widgets/supported_vendors_tile_grid_view.dart';
import 'package:site/presentation/route_names.dart';
import 'package:site/presentation/shared_widgets/bottom_navigation_menu/bottom_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

/// Home page content for the mobile and tablet screen size
class HomePageContentMobileTablet extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  final YoutubePlayerController _controller = YoutubePlayerController();

  @override
  Widget build(BuildContext context) {
    _controller.loadVideoById(
      startSeconds: 120,
      videoId: 'o5owbiQahnY',
    );
    return Scrollbar(
      thumbVisibility: true,
      thickness: 13,
      controller: _scrollController,
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CachedNetworkImage(
                  imageUrl: 'https://i.ibb.co/2SwVLf3/House.jpg',
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'CyBear Jinni',
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 170, top: 0.5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Smart Home',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            margin: const EdgeInsets.only(top: 200),
                            child: YoutubePlayerControllerProvider(
                              controller: _controller,
                              child: YoutubePlayer(controller: _controller),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.blue.withOpacity(0.1),
                height: 100.0,
                child: Center(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      children: [
                        TextSpan(text: 'CyBear Jinni '),
                        TextSpan(
                          text: 'connects',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' all your devices with '),
                        TextSpan(
                          text: 'Open Source',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 50, right: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    EasyToSetUpBenefitBlock(),
                    const SizedBox(
                      height: 30,
                    ),
                    EasyToUseBenefitBlock(),
                    const SizedBox(
                      height: 30,
                    ),
                    PrivacyAndOpenSourceBenefitBlock(),
                  ],
                ),
              ),
              SizedBox(
                child: SizedBox(
                  height: 370,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black38,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        integrationsRoute,
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Supported Vendors',
                              style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                        Container(),
                        SizedBox(
                          width: 470,
                          child: SupportedVendorsTileGridView(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black26,
                height: 500,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.zero,
                    ),
                  ),
                  onPressed: () async {
                    const String url = 'https://snapcraft.io/cybear-jinni';
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'CyBear Jinni Smart Devices Distribution',
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            'https://i.ibb.co/FDKKWNM/World-devices-usage-map.png',
                        fit: BoxFit.scaleDown,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
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
