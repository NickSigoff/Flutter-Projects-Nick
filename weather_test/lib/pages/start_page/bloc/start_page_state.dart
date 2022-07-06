part of 'start_page_bloc.dart';

@immutable
abstract class StartPageState {}

class StartPageInitial extends StartPageState {}

class StartPageLoading extends StartPageState {}

/// if the inputted city has been found and it's weather has fetched
class StartPageSuccess extends StartPageState {
  final WeatherForecast weatherForecast;

  StartPageSuccess({required this.weatherForecast});
}

/// empty city field
class StartPageCityNameError extends StartPageState {
  final String errorMessage;

  StartPageCityNameError({required this.errorMessage});
}

/// no internet
class StartPageErrorFetching extends StartPageState {
  final String? errorMessage;

  StartPageErrorFetching({this.errorMessage});
}
