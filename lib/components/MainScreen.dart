import 'package:flutter/widgets.dart';
import 'package:weather/components/WeatherHours.dart';
import 'package:weather/models/Weather.dart';
import 'WeatherCard.dart';

class MainScreen extends StatelessWidget {
  final Weather weather;
  final List<Weather> hourlyWeather;

  const MainScreen({Key key, this.weather, this.hourlyWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            weather.city,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text('${weather.description}'),
          Spacer(),
          WeatherCard(
            title: "Now",
            temperature: weather.temperature,
            icon: weather.icon,
            temperatureFontSize: 64,
            iconScale: 1,
          ),
          Spacer(),
          HourlyWeather(hourlyWeather: this.hourlyWeather)
        ],
      ),
    );
  }
}
