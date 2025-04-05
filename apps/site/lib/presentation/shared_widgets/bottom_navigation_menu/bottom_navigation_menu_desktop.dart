import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Bottom navigation menu for desktop screen size
class BottomNavigationMenuDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                thickness: 1,
                height: 3,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        'Apps',
                        style: TextStyle(fontSize: 40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SizedBox(
                            width: 40,
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => const CupertinoAlertDialog(
                                  title: Text(
                                    'Currently does not exist',
                                  ),
                                  content: Text(
                                    'The app support IOS but currently does not exist in the App store.\n'
                                    'It will be added in the future.',
                                  ),
                                ),
                              );
                            },
                            child: Tab(
                              icon: FaIcon(
                                FontAwesomeIcons.appStoreIos,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              child: Text(
                                'App Store',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          TextButton(
                            onPressed: () {
                              launchUrlString(
                                'https://play.google.com/store/apps/details?id=com.cybear_jinni.smart_home',
                              );
                            },
                            child: Tab(
                              icon: FaIcon(
                                FontAwesomeIcons.googlePlay,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              child: Text(
                                'Play Store',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          TextButton(
                            onPressed: () {
                              launchUrlString(
                                'https://snapcraft.io/cybear-jinni',
                              );
                            },
                            child: Tab(
                              icon: FaIcon(
                                FontAwesomeIcons.ubuntu,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              child: Text(
                                'Snap Store',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        'Follow Us',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SizedBox(
                            width: 40,
                          ),
                          TextButton(
                            onPressed: () {
                              launchUrlString(
                                'https://twitter.com/CyBearJinni',
                              );
                            },
                            child: Tab(
                              icon: FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              child: const Text(''),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              launchUrlString(
                                'https://instagram.com/cybearjinni?igshid=rfllj6qbv6l8',
                              );
                            },
                            child: Tab(
                              icon: FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              child: const Text(''),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              launchUrlString(
                                'https://www.linkedin.com/company/cybear-jinni',
                              );
                            },
                            child: Tab(
                              icon: FaIcon(
                                FontAwesomeIcons.linkedin,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              child: const Text(''),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              launchUrlString('https://discord.gg/mUXfwUY');
                            },
                            child: Tab(
                              icon: FaIcon(
                                FontAwesomeIcons.discord,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              child: const Text(''),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              launchUrlString(
                                'https://github.com/CyBear-Jinni',
                              );
                            },
                            child: Tab(
                              icon: FaIcon(
                                FontAwesomeIcons.github,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                              child: const Text(''),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
