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
          emit(StartPageFieldError(errorMessage: 'Field is empty'));
        } else {
          WeatherForecast weatherForecast =
              await WeatherApi().fetchWeatherForecastWithCity(cityName);
          emit(StartPageSuccess(weatherForecast: weatherForecast));
        }
      } catch (e) {
        emit(StartPageErrorFetching());
      }
    });
  }
}
