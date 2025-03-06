import 'package:site/my_singleton.dart';
import 'package:site/presentation/new_home_page/widgets/border_text_with_shadow.dart';
import 'package:site/presentation/route_names.dart';
import 'package:flutter/material.dart';

class NewNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            if (MySingleton.getCurrentPageName != 'landingPage' &&
                MySingleton.getCurrentPageName != homeRoute) {
              Navigator.pushNamed(context, homeRoute);
            } else {
              Navigator.pushReplacementNamed(context, homeRoute);
            }
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: const Image(
                  height: 60,
                  image: AssetImage(
                    'assets/images/cbj_app_icon_no_bg.png',
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: const Text(
                  'CyBear Jinni',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                top: 20,
                right: 40,
              ),
              child: TextButton(
                onPressed: () {
                  if (MySingleton.getCurrentPageName != aboutRoute) {
                    Navigator.pushNamed(context, aboutRoute);
                  } else {
                    Navigator.pushReplacementNamed(context, aboutRoute);
                  }
                },
                child: const BorderTextWithShadow(
                  'About',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: TextButton(
                onPressed: () {
                  if (MySingleton.getCurrentPageName != faqRoute) {
                    Navigator.pushNamed(context, faqRoute);
                  } else {
                    Navigator.pushReplacementNamed(context, faqRoute);
                  }
                },
                child: const BorderTextWithShadow(
                  'FAQ',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: TextButton(
                onPressed: () {
                  if (MySingleton.getCurrentPageName != setUpRoute) {
                    Navigator.pushNamed(context, setUpRoute);
                  } else {
                    Navigator.pushReplacementNamed(context, setUpRoute);
                  }
                },
                child: const BorderTextWithShadow(
                  'Setup',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: TextButton(
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
                child: const BorderTextWithShadow(
                  'Integrations',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 40,
              ),
              child: const Text(''),
            ),
          ],
        ),
      ],
    );
  }
}
