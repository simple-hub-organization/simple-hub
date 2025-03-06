import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PrivacyAndOpenSourceBenefitBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.white,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(30),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.8)),
        ),
        onPressed: () async {
          const String url = 'https://github.com/CyBear-Jinni';
          if (await canLaunchUrlString(url)) {
            await launchUrlString(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: SizedBox(
          height: 390,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: <Widget>[
                      const FaIcon(
                        FontAwesomeIcons.laptopCode,
                        color: Colors.black,
                        size: 60,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Privacy & Open Source',
                        style: TextStyle(
                          fontSize: 26,
                          color: HexColor('#08358C'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  FaIcon(
                    FontAwesomeIcons.check,
                    color: Colors.green,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'All your data will be saved '
                      'locally on your Hub so you '
                      'will have control of your  data.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  FaIcon(
                    FontAwesomeIcons.check,
                    color: Colors.green,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Open source code with easy '
                      'structure for adding support '
                      'for new vendors and new '
                      'devices types.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
