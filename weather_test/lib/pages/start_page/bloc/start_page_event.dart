part of 'start_page_bloc.dart';

@immutable
abstract class StartPageEvent {}

class OnTapContinueButtonEvent extends StartPageEvent {
  final String cityName;

  OnTapContinueButtonEvent({required this.cityName});
}
