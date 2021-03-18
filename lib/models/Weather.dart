enum WeatherCondition { clear, fewCloudy, cloudy, fullCloudy, shower, rain, thunderstorm, snow, mist }

class Weather {
  final String city;
  final int temperature;
  final String icon;
  final WeatherCondition status;
  final String description;
  final DateTime time;

  Weather(
      {this.city, this.temperature, this.icon, this.status, this.description, this.time });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json['name'],
        temperature: double.parse(json['main']['temp'].toString()).toInt(),
        icon: json['weather'][0]['icon'],
        status: _mapStringToWeatherCondition(json['weather'][0]['icon']),
        description: json['weather'][0]['main'],
        time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000));
  }

  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case '01d':
        state = WeatherCondition.clear;
        break;
      case '02d':
        state = WeatherCondition.fewCloudy;
        break;
      case '03d':
        state = WeatherCondition.cloudy;
        break;
      case '04d':
        state = WeatherCondition.fullCloudy;
        break;
      case '09d':
        state = WeatherCondition.shower;
        break;
      case '10d':
        state = WeatherCondition.rain;
        break;
      case '11d':
        state = WeatherCondition.thunderstorm;
        break;
      case '13d':
        state = WeatherCondition.snow;
        break;
      case '50d':
        state = WeatherCondition.mist;
        break;
    }
    return state;
  }
}
