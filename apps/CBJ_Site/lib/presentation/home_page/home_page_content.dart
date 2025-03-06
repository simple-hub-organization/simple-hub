import 'package:cybear_jinni_site/application/new_home_page/new_home_page_bloc.dart';
import 'package:cybear_jinni_site/injection.dart';
import 'package:cybear_jinni_site/presentation/home_page/home_page_content_mobile_tablet.dart';
import 'package:cybear_jinni_site/presentation/new_home_page/widgets/new_home_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Home page content
class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => HomePageContentMobileTablet(),
      desktop: (context) {
        return BlocProvider(
          create: (context) => getIt<NewHomePageBloc>()
            ..add(const NewHomePageEvent.initialized()),
          child: NewHomePageWidget(),
        );
      },
    );
  }
}
