import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:site/presentation/home_page/widgets/easy_to_set_up_benefit_block.dart';
import 'package:site/presentation/home_page/widgets/easy_to_use_benefit_block.dart';
import 'package:site/presentation/home_page/widgets/privacy_and_open_source_benefit_block.dart';
import 'package:site/presentation/home_page/widgets/supported_vendors_tile_grid_view.dart';
import 'package:site/presentation/route_names.dart';
import 'package:site/presentation/shared_widgets/bottom_navigation_menu/bottom_navigation_menu.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

/// Home page content for the desktop
class HomePageContentDesktop extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  final List<String> companysLogs = [
    'https://i.ibb.co/2qN6yJW/lifx-logo.png',
    'https://i.ibb.co/C20VvvB/yeelight-logo.png',
    'https://i.ibb.co/hfRhB0Q/mqtt-logo.png',
  ];

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
                  margin: const EdgeInsets.only(top: 100, left: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black..withAlpha((0.8 * 255).toInt()),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'CyBear Jinni',
                            style: TextStyle(
                              fontSize: 60,
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 204, top: 0.5),
                        decoration: BoxDecoration(
                          color: Colors.black..withAlpha((0.8 * 255).toInt()),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Smart Home',
                            style: TextStyle(
                              fontSize: 21,
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(300, 20, 300, 0),
                        child: YoutubePlayerControllerProvider(
                          // Provides controller to all the widget below it.
                          controller: _controller,
                          child: YoutubePlayer(
                            controller: _controller,
                          ),
                        ),
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
                color: Colors.blue.withAlpha((0.1 * 255).toInt()),
                height: 100.0,
                child: Center(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 24),
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
                color: Colors.black12,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        EasyToSetUpBenefitBlock(),
                        const SizedBox(
                          width: 30,
                        ),
                        EasyToUseBenefitBlock(),
                        const SizedBox(
                          width: 30,
                        ),
                        PrivacyAndOpenSourceBenefitBlock(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
                child: TextButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(30),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      Colors.black45,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      integrationsRoute,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Supported Vendors',
                            style: TextStyle(
                              fontSize: 40,
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                      Container(),
                      Container(),
                      SizedBox(
                        width: 450,
                        child: AlignedGridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: true,
                          crossAxisCount: 2,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return SupportedVendorsTileGridViewNetworkImage(
                              companysLogs[index],
                            );
                          },
                          // staggeredTileBuilder: (int index) =>
                          //     StaggeredTile.count(2, index.isEven ? 1.5 : 1.5),
                          mainAxisSpacing: 30.0,
                          crossAxisSpacing: 26.0,
                        ),
                      ),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 500,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Colors.black26,
                    ),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      setUpRoute,
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Easily Set Up',
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://i.ibb.co/10VvrzJ/raspberry-Pi-background.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              color:
                                  Colors.black.withAlpha((0.2 * 255).toInt()),
                            ),
                            child: Container(
                              width: 500,
                              padding: const EdgeInsets.only(
                                left: 40,
                                right: 40,
                                top: 10,
                                bottom: 30,
                              ),
                              color:
                                  Colors.black.withAlpha((0.4 * 255).toInt()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Center(
                                    child: Text(
                                      'For RaspberryPi',
                                      style: TextStyle(
                                        fontSize: 28,
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '1. ',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color,
                                          ),
                                        ),
                                        const TextSpan(text: 'Download ISO'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '2. ',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Install ISO to SD card and '
                                              'insert it',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '3. ',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Open the app on your '
                                              'phone\n',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://i.ibb.co/m0FKVyq/linux-background.webp',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              width: 500,
                              color:
                                  Colors.black.withAlpha((0.7 * 255).toInt()),
                              padding: const EdgeInsets.only(
                                left: 40,
                                right: 40,
                                top: 10,
                                bottom: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Center(
                                    child: Text(
                                      'For Linux',
                                      style: TextStyle(
                                        fontSize: 28,
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '1. ',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Install MQTT broker snap',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '2. ',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Install CyBear '
                                              'Jinni Hub Snap',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '3. ',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Open the app on your phone'
                                              '\n',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.check,
                            color: Colors.green,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'We will add all the smart home devices '
                            'automatically for you',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white
                                ..withAlpha((0.8 * 255).toInt()),
                            ),
                          ),
                        ],
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
