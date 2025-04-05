import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Text(
          'News',
          style: TextStyle(
            fontSize: 23.0,
            color: Theme.of(context).textTheme.bodyLarge!.color,
            decoration: TextDecoration.underline,
          ),
        ).tr(),
        Container(
          height: 20,
        ),
        const Text('Empty_history').tr(),
      ],
    );
  }
}
