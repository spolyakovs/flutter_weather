import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequest extends WeatherEvent {
  final String city;

  const WeatherRequest({this.city = ""})
      : assert(city != null);

  @override
  List<Object> get props => [city];
}
