import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'new_home_page_bloc.freezed.dart';
part 'new_home_page_event.dart';
part 'new_home_page_state.dart';

@injectable
class NewHomePageBloc extends Bloc<NewHomePageEvent, NewHomePageState> {
  NewHomePageBloc() : super(NewHomePageState.initialized()) {
    on<Initialized>(_initialized);
    on<ScrollPage>(_scrollPage);
  }

  Future<void> _initialized(
    Initialized event,
    Emitter<NewHomePageState> emit,
  ) async {
    // final newHomePageList = await _vendorRepository.getNewHomePage();
    emit(const NewHomePageState.loaded(0, 0));
  }

  Future<void> _scrollPage(
    ScrollPage event,
    Emitter<NewHomePageState> emit,
  ) async {
    // pageController.animateToPage(
    //   currentPage,
    //   duration: const Duration(seconds: 3),
    //   curve: Curves.easeIn,
    // );

    emit(NewHomePageState.loaded(event.scrollPosition, event.currentPage));
  }
}
