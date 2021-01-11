import 'package:cybear_jinni/features/home_page/rooms_manager_widget.dart';
import 'package:cybear_jinni/features/home_page/tabs/lamps_tab/settings_page_of_lamps.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LampsWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.arrowLeft,
                    color: Theme.of(context).textTheme.bodyText1.color),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.cog,
                    color: Theme.of(context).textTheme.bodyText1.color),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SettingsPageOfLamps(),
                  ),
                ),
              ),
            ),
          ],
        ),

        Text(
          'Lamps_Page',
          style: TextStyle(
              fontSize: 23.0,
              color: Theme.of(context).textTheme.bodyText1.color,
              decoration: TextDecoration.underline),
        ).tr(),
        Container(
          height: 20,
        ),
        RoomsManagerWidget()
      ],
    );
  }
}
