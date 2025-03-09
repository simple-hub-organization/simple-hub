import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:site/presentation/shared_widgets/bottom_navigation_menu/bottom_navigation_menu.dart';
import 'package:site/presentation/shared_widgets/navigation_drawer/navigation_drawer.dart';

/// About page content for the mobile and tablet screen size
class AboutPageContentMobileTablet extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          stops: const <double>[0, 0, 0, 1],
          colors: <Color>[
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).primaryColor,
          ],
        ),
      ),
      child: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) =>
            SelectionArea(
          child: Scaffold(
            drawer:
                sizingInformation.deviceScreenType == DeviceScreenType.mobile
                    ? NavigationDrawerWidget()
                    : null,
            backgroundColor: Colors.transparent,
            body: Scrollbar(
              thumbVisibility: true,
              thickness: 13,
              controller: _scrollController,
              child: ListView(
                controller: _scrollController,
                children: <Widget>[
                  Container(
                    color: Colors.black26,
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 30),
                    height: 150,
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Text(
                        'About',
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
                    color: Colors.black54,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            SizedBox(
                              width: 200,
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.ibb.co/xjHByJX/Founder-Guy-Luz-circle.png',
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
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Guy Luz Founder of CyBear Jinni',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          '"The power to improve the world is in our hands.'
                          '\n    Lets create a future where everyone'
                          ' can have\n'
                          '    the option to save their privacy without '
                          'sacrificing user experience."',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black26,
                    height: 500.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Fan Art',
                          style: TextStyle(
                            fontSize: 50,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'We are happy to share with you our community love '
                          'and support with their creative fan art.',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://i.ibb.co/XXVyGsJ/Cy-Bear-Jinni-art-1.jpg',
                            height: 250,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationMenu(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
