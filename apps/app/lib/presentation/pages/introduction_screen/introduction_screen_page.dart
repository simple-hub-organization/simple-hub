import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:simple_hub/presentation/pages/introduction_screen/introduction_screen_body.dart';

@RoutePage()
class IntroductionScreenPage extends StatelessWidget {
  static String tag = 'login-page';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IntroductionScreenBody(),
    );
  }
}
