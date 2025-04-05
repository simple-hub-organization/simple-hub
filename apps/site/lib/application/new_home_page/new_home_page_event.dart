part of 'new_home_page_bloc.dart';

@freezed
class NewHomePageEvent with _$NewHomePageEvent {
  const factory NewHomePageEvent.initialized() = Initialized;

  const factory NewHomePageEvent.scrollPage(
    double scrollPosition,
    int currentPage,
  ) = ScrollPage;
}
