part of 'new_home_page_bloc.dart';

@freezed
class NewHomePageState with _$NewHomePageState {
  const factory NewHomePageState() = _NewHomePageState;

  factory NewHomePageState.initialized() => const NewHomePageState();

  const factory NewHomePageState.loading(
    double scrollPosition,
    int currentPage,
  ) = Loading;

  const factory NewHomePageState.loaded(
    double scrollPosition,
    int currentPage,
  ) = Loaded;

  const factory NewHomePageState.error() = Error;
}
