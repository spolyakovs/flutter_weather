import 'package:bloc/bloc.dart';
import 'package:weather/API/WeatherApi.dart';
import 'package:weather/StatesEvents/WeatherEvent.dart';
import 'package:weather/StatesEvents/WeatherState.dart';
import 'package:weather/models/Weather.dart';
import 'dart:async';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final String city;
  WeatherBloc(this.city) : super(null) {
    add(WeatherRequest(city: city));
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequest) {
      yield WeatherLoadProgress();
      try {
        final Weather weather =
            await WeatherApi.fetchCurrentWeather(query: event.city);
        final List<Weather> hourlyWeather =
            await WeatherApi.fetchHourlyWeather(query: event.city);
        yield WeatherLoadSuccess(
            weather: weather, hourlyWeather: hourlyWeather);
      } catch (_) {
        yield WeatherLoadFail();
      }
    }
  }
}
