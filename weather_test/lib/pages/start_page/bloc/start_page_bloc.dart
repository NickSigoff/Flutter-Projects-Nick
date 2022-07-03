import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_test/api/weather_api.dart';
import 'package:weather_test/models/weather_forecast.dart';

part 'start_page_event.dart';

part 'start_page_state.dart';

class StartPageBloc extends Bloc<StartPageEvent, StartPageState> {
  StartPageBloc() : super(StartPageInitial()) {
    on<OnTapContinueButtonEvent>((event, emit) async {
      try {
        emit(StartPageLoading());
        String cityName = event.cityName;
        if (cityName.isEmpty) {
          emit(StartPageCityNameError(errorMessage: 'Field is empty'));
        } else {
          WeatherForecast weatherForecast = await WeatherApi()
              .fetchWeatherForecastWithCity(cityName)
              .timeout(const Duration(seconds: 10), onTimeout: () {
            throw TimeoutException('Error by fetching data');
          });
          emit(StartPageSuccess(weatherForecast: weatherForecast));
        }
      } on TimeoutException catch (_) {
        emit(StartPageErrorFetching(errorMessage: 'Error by fetching data'));
      } on FormatException catch (_) {
        emit(StartPageCityNameError(errorMessage: 'Field is empty'));
      } on HttpException catch (_) {
        emit(StartPageErrorFetching(errorMessage: 'Error by fetching data'));
      } catch (_) {
        emit(StartPageCityNameError(errorMessage: 'Field is empty'));
      }
    });
  }
}
