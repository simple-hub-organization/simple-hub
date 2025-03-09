import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:site/presentation/shared_widgets/bottom_navigation_menu/bottom_navigation_menu.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Faq page content for the mobile and tablet screen size
class FaqPageContentMobileTablet extends StatelessWidget {
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
                height: 150,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text(
                    'Frequently Asked Questions',
                    style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black..withAlpha((0.3 * 255).toInt()),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 10,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Q&A',
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
                          ExpandablePanel(
                            theme: const ExpandableThemeData(
                              iconColor: Colors.white,
                            ),
                            header: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(fontSize: 20),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'Q:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Is there option to control the '
                                            'Hub out side of the local '
                                            'network',
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  thickness: 0.08,
                                  height: 3,
                                ),
                              ],
                            ),
                            collapsed: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: 'A:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' Yes, but you will need to ask for '
                                        'it in the ',
                                  ),
                                  TextSpan(
                                    text: 'Discord server',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const String url =
                                            'https://discord.gg/mUXfwUY';
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' for your home.',
                                  ),
                                ],
                              ),
                            ),

                            expanded: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(fontSize: 20),
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: 'A:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' Yes, but you will need to ask for '
                                        'it in the ',
                                  ),
                                  TextSpan(
                                    text: 'Discord server',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const String url =
                                            'https://discord.gg/mUXfwUY';
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' for your '
                                        'home.\n'
                                        'We are working on making it work'
                                        ' out of the box for everyone.\n',
                                  ),
                                  const TextSpan(
                                    text: 'It is important to note that it is '
                                        'only transferring '
                                        'your requests to your Hub ',
                                  ),
                                  const TextSpan(
                                    text: 'without',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' collecting any information '
                                        'about you.\n\n',
                                  ),
                                  const TextSpan(
                                    text: 'There is also a way to set your own '
                                        'routing system using ',
                                  ),
                                  TextSpan(
                                    text: 'cbj remote-pipes',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const String url =
                                            'https://github.com/CyBear-Jinni/cbj_remote-pipes';
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' but it is currently missing a '
                                        'documentation.\n'
                                        'For advance computer users you can'
                                        ' ask for help setting it up in '
                                        'the ',
                                  ),
                                  TextSpan(
                                    text: 'Discord server',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const String url =
                                            'https://discord.gg/mUXfwUY';
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '.',
                                  ),
                                ],
                              ),
                            ),

                            // tapHeaderToExpand: true,
                            // hasIcon: true,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ExpandablePanel(
                            theme: const ExpandableThemeData(
                              iconColor: Colors.white,
                            ),
                            header: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(fontSize: 20),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'Q:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' What can I do if my device '
                                            "isn't supported",
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  thickness: 0.08,
                                  height: 3,
                                ),
                              ],
                            ),
                            collapsed: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: 'A:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' You can ask us to add support for '
                                        'it in the ',
                                  ),
                                  TextSpan(
                                    text: 'Discord server',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const String url =
                                            'https://discord.gg/mUXfwUY';
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' or by'
                                        ' opening a ',
                                  ),
                                  TextSpan(
                                    text: 'new GitHub issue',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const String url =
                                            'https://github.com/CyBear-Jinni/cbj_hub/issues/new';
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '.',
                                  ),
                                ],
                              ),
                            ),

                            expanded: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(fontSize: 20),
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: 'A:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' You can ask us to add support for '
                                        'it in the ',
                                  ),
                                  TextSpan(
                                    text: 'Discord server',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const String url =
                                            'https://discord.gg/mUXfwUY';
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' or by opening a ',
                                  ),
                                  TextSpan(
                                    text: 'GitHub issue',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const String url =
                                            'https://github.com/CyBear-Jinni/cbj_hub/issues';
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '.\n',
                                  ),
                                ],
                              ),
                            ),

                            // tapHeaderToExpand: true,
                            // hasIcon: true,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ExpandablePanel(
                            theme: const ExpandableThemeData(
                              iconColor: Colors.white,
                            ),
                            header: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(fontSize: 20),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'Q:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' In what way is this project '
                                            'different',
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  thickness: 0.08,
                                  height: 3,
                                ),
                              ],
                            ),
                            collapsed: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'A:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' We found that other projects are '
                                        'missing an easy setup and simple UI '
                                        'that can reach the masses, so we '
                                        'decided to create another option.',
                                  ),
                                ],
                              ),
                            ),

                            expanded: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(fontSize: 20),
                                children: const [
                                  TextSpan(
                                    text: 'A:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  CyBear Jinni was founded from a '
                                        'desire to do more good in the world.\n'
                                        'We believe in openness and trust. '
                                        'Therefore we aime to share our Smart '
                                        'Home with as much people as possible.'
                                        '\nWe found that other projects are '
                                        'missing an easy setup and simple UI '
                                        'that can reach the masses, so we '
                                        'decided to create another option.\n'
                                        'By combining open source with as '
                                        'much automatic setup as possible we '
                                        'hope people all around the world will '
                                        'join us in making the best Smart'
                                        ' Home System.',
                                  ),
                                ],
                              ),
                            ),

                            // tapHeaderToExpand: true,
                            // hasIcon: true,
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
