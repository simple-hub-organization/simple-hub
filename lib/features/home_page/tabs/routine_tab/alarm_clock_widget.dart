import 'package:cybear_jinni/main.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Showing alarm clock
class AlarmClockWidget extends StatelessWidget {
  final String subText;

  final String headerText;

  final String backgroundImage;

  final String content;

  AlarmClockWidget(this.headerText, this.subText, this.backgroundImage, this.content);

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: Theme.of(context).textTheme.bodyText1.color,
            width: 0.6,
          )),
      child: ExpansionCard(
        borderRadius: 20,
        background: Image.asset(
          backgroundImage,
          fit: BoxFit.cover,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  headerText,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Switch(
                    value: isSwitched,
                    inactiveTrackColor: Colors.grey.withOpacity(0.6),
                    onChanged: (value) async {
                      // setState(() {
                      // isSwitched = value;
                      // print(isSwitched);

                      // await zonedScheduleNotification();
                      //
                      await showNotificationCustomSound();
                    }),
              ],
            ),
            Text(
              subText,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(content, style: const TextStyle(fontSize: 20)),
          )
        ],
      ),
    ));
  }
}
