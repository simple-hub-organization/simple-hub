import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/pages/introduction_screen/introductions_view_model_body/introduction_screen_body_about_page.dart';
import 'package:simple_hub/presentation/pages/introduction_screen/introductions_view_model_body/introduction_screen_body_welcome_page.dart';

class IntroductionScreenBody extends StatefulWidget {
  @override
  State<IntroductionScreenBody> createState() => _IntroductionScreenBodyState();
}

class _IntroductionScreenBodyState extends State<IntroductionScreenBody> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final Size screenSize = MediaQuery.of(context).size;
    final double sizeWidth = screenSize.width;
    final double sizeHeight = screenSize.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          stops: const [0.06, 0.9],
          colors: [
            HexColor('#ca6ce3'),
            HexColor('#aa5fe4'),
          ],
        ),
      ),
      child: IntroductionScreen(
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.white,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        globalBackgroundColor: Colors.transparent,
        pages: [
          PageViewModel(
            useScrollView: false,
            titleWidget: const SizedBox(),
            bodyWidget: SizedBox(
              width: sizeWidth,
              height: sizeHeight - 195,
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Expanded(
                    child: Center(
                      child: ImageAtom(
                        'assets/cbj_logo.png',
                        hero: 'full_logo',
                      ),
                    ),
                  ),
                  Expanded(
                    child: MarginedExpandedAtom(
                      child: Column(
                        children: [
                          TextAtom(
                            'CyBear Jinni',
                            style: textTheme.displaySmall!
                                .copyWith(color: Colors.white),
                          ),
                          const SeparatorAtom(
                            variant: SeparatorVariant.farAppart,
                          ),
                          IntroductionScreenBodyWelcomePage(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            titleWidget: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextAtom(
                  'Our Vision',
                  style: textTheme.displaySmall!.copyWith(color: Colors.white),
                ),
              ],
            ),
            bodyWidget: IntroductionScreenBodyAboutPage(),
          ),
        ],
        next: TextAtom(
          'Next',
          style: textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
        done: TextAtom(
          'Done',
          style: textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
        onDone: () async {
          // final HashMap<String, DeviceEntityBase> entities =
          //     await ConnectionsService.instance.getEntities;
          if (!mounted) {
            return;
          }
          // if (entities.isNotEmpty) {
          //   context.router.replace(const HomeRoute());
          //   return;
          // }
          context.router.replace(const ConnectToHubRoute());
        },
      ),
    );
  }
}
