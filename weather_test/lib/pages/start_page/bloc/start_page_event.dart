part of 'start_page_bloc.dart';

@immutable
abstract class StartPageEvent {}

/// Tap continue button event at start_page
class OnTapContinueButtonEvent extends StartPageEvent {
  final String cityName;

  OnTapContinueButtonEvent({required this.cityName});
}
