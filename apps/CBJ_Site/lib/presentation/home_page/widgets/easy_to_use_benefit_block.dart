import 'package:cybear_jinni_site/presentation/route_names.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class EasyToUseBenefitBlock extends StatelessWidget {
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
        onPressed: () {
          Navigator.pushNamed(context, integrationsRoute);
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
                        FontAwesomeIcons.users,
                        color: Colors.black,
                        size: 60,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Easy to Use',
                        style: TextStyle(
                          fontSize: 26,
                          color: HexColor('#651010'),
                        ),
                      ),
                    ],
                  ),
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
                      'The application will add '
                      'discovered devices '
                      'automatically for you.',
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
                      'Simple user interface with'
                      ' clear separation between '
                      'different actions:\nscenes, '
                      'control devices,\n'
                      'routines, bindings.',
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
