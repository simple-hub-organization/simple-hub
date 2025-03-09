import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site/application/new_home_page/new_home_page_bloc.dart';
import 'package:site/presentation/new_home_page/widgets/home_page_first_part.dart';
import 'package:site/presentation/new_home_page/widgets/home_page_second_part.dart';
import 'package:site/presentation/new_home_page/widgets/home_page_thired_part.dart';
import 'package:site/presentation/new_home_page/widgets/tab_indicator.dart';

class NewHomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewHomePageBloc, NewHomePageState>(
      builder: (context, state) {
        return state.map(
          (value) => const Text('Loading the site'),
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (loadedState) {
            final PageController pageController = PageController();

            bool scrollAnimationCompleted = false;

            int currentPage = loadedState.currentPage;
            const int numberOfPages = 3;

            Future.delayed(const Duration(milliseconds: 100))
                .then((value) async {
              pageController.animateToPage(
                loadedState.currentPage,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut,
              );
              currentPage = loadedState.currentPage;
              await Future.delayed(const Duration(milliseconds: 100));
              scrollAnimationCompleted = true;
            });

            return Listener(
              onPointerSignal: (pointerSignal) {
                if (pointerSignal is PointerScrollEvent &&
                    scrollAnimationCompleted) {
                  final double scrollAmount = pointerSignal.scrollDelta.dy;

                  if (scrollAmount > 0 && currentPage + 1 < numberOfPages) {
                    currentPage++;
                  } else if (scrollAmount < 0 && currentPage - 1 > -1) {
                    currentPage--;
                  } else {
                    return;
                  }
                  context.read<NewHomePageBloc>().add(
                        NewHomePageEvent.scrollPage(
                          pageController.page!,
                          currentPage,
                        ),
                      );
                }
              },
              child: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      HomePageFirstPart(),
                      HomePageSecondPart(),
                      HomePageThiredPart(),
                      const ColoredBox(
                        color: Colors.red,
                        child: Center(
                          child: Text('Third Page'),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TabIndicator(numberOfPages, currentPage),
                  ),
                ],
              ),
            );
          },
          error: (_) {
            return const Text('Error');
          },
        );
      },
    );
  }
}
