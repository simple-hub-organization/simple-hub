import 'package:cached_network_image/cached_network_image.dart';
import 'package:cybear_jinni_site/presentation/home_page/widgets/easy_to_set_up_benefit_block.dart';
import 'package:cybear_jinni_site/presentation/home_page/widgets/easy_to_use_benefit_block.dart';
import 'package:cybear_jinni_site/presentation/home_page/widgets/privacy_and_open_source_benefit_block.dart';
import 'package:cybear_jinni_site/presentation/new_home_page/widgets/border_text_with_shadow.dart';
import 'package:flutter/material.dart';

class HomePageSecondPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox.expand(
          child: CachedNetworkImage(
            imageUrl:
                // 'https://images.macrumors.com/t/akS-rfKtypWuIFOGfmWE2nZz-ac=/1600x/http://images.macrumors.com/article-new/2017/11/lifxzlightstrips.jpg'
                'https://i.ibb.co/vVn0v70/home-page-section-2-background.webp'

            // 'https://wallpaperaccess.com/full/3644270.jpg'
            // 'https://cdn.vox-cdn.com/thumbor/qCHcHkgH7TAc2SCOTQLj9UkQLQo=/0x0:1200x739/2420x1613/filters:focal(504x274:696x466)/cdn.vox-cdn.com/uploads/chorus_image/image/56981041/slack_imgs.0.jpg'
            // 'https://cdn.vox-cdn.com/thumbor/p8mU0Z3el-wDtvjMF62Wz4hCets=/0x0:1499x1000/1200x800/filters:focal(631x381:869x619)/cdn.vox-cdn.com/uploads/chorus_image/image/56785169/LIFX_Mini_LED_Lighting_Image.0.jpg'
            // 'https://images.macrumors.com/t/akS-rfKtypWuIFOGfmWE2nZz-ac=/1600x/http://images.macrumors.com/article-new/2017/11/lifxzlightstrips.jpg'
// 'https://9to5toys.com/wp-content/uploads/sites/5/2018/09/lifx-tile-starter-kit.jpg'

            ,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const BorderTextWithShadow(
                    'About us',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      BorderTextWithShadow(
                        'CyBear Jinni ',
                        fontSize: 25,
                      ),
                      BorderTextWithShadow(
                        'Connects',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      BorderTextWithShadow(
                        ' all your devices with ',
                        fontSize: 25,
                      ),
                      BorderTextWithShadow(
                        'Open Source',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                  EasyToSetUpBenefitBlock(),
                  EasyToUseBenefitBlock(),
                  PrivacyAndOpenSourceBenefitBlock(),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
