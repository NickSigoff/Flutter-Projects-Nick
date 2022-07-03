part of 'start_page_bloc.dart';

@immutable
abstract class StartPageState {}

class StartPageInitial extends StartPageState {}

class StartPageLoading extends StartPageState {}

class StartPageSuccess extends StartPageState {
  final WeatherForecast weatherForecast;

  StartPageSuccess({required this.weatherForecast});
}

class StartPageCityNameError extends StartPageState {
  final String errorMessage;

  StartPageCityNameError({required this.errorMessage});
}

class StartPageErrorFetching extends StartPageState {
  final String? errorMessage;

  StartPageErrorFetching({this.errorMessage});
}
