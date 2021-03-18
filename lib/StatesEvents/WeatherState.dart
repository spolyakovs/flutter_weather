import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather/models/Weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoadProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  final List<Weather> hourlyWeather;

  const WeatherLoadSuccess(
      {@required this.weather, @required this.hourlyWeather})
      : assert(weather != null);

  @override
  List<Object> get props => [weather, hourlyWeather];
}

class WeatherLoadFail extends WeatherState {}
