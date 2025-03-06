import 'package:cybear_jinni_site/my_singleton.dart';
import 'package:cybear_jinni_site/presentation/home_page/home_page.dart';
import 'package:cybear_jinni_site/presentation/route_names.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// The specific look for the top navigation menu for tablet desktop
class TopNavigationMenuDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipPath(
            clipper: CrosRightSizde(),
            child: ColoredBox(
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    height: 72,
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      if (MySingleton.getCurrentPageName != 'landingPage' &&
                          MySingleton.getCurrentPageName != homeRoute) {
                        Navigator.pushNamed(
                          context,
                          homeRoute,
                        );
                      } else {
                        Navigator.pushReplacementNamed(context, homeRoute);
                      }
                    },
                    child: const Image(
                      height: 60,
                      image: AssetImage(
                        'assets/images/cbj_app_icon_no_bg.png',
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
            ),
          ),
          ClipPath(
            clipper: CrosLeftSizde(),
            child: ColoredBox(
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                    onPressed: () {
                      if (MySingleton.getCurrentPageName != aboutRoute) {
                        Navigator.pushNamed(context, aboutRoute);
                      } else {
                        Navigator.pushReplacementNamed(context, aboutRoute);
                      }
                    },
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.addressCard,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: Text(
                        'About',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      if (MySingleton.getCurrentPageName != faqRoute) {
                        Navigator.pushNamed(context, faqRoute);
                      } else {
                        Navigator.pushReplacementNamed(context, faqRoute);
                      }
                    },
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.circleQuestion,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: Text(
                        'FAQ',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      if (MySingleton.getCurrentPageName != setUpRoute) {
                        Navigator.pushNamed(context, setUpRoute);
                      } else {
                        Navigator.pushReplacementNamed(context, setUpRoute);
                      }
                    },
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.shapes,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: Text(
                        'Set Up',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      if (MySingleton.getCurrentPageName != integrationsRoute) {
                        Navigator.pushNamed(context, integrationsRoute);
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          integrationsRoute,
                        );
                      }
                    },
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.lightbulb,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: Text(
                        'Integrations',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      if (MySingleton.getCurrentPageName != 'landingPage' &&
                          MySingleton.getCurrentPageName != homeRoute) {
                        Navigator.pushNamed(context, homeRoute);
                      } else {
                        Navigator.pushReplacementNamed(context, homeRoute);
                      }
                    },
                    child: Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.house,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
