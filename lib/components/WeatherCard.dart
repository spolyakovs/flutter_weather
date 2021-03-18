import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String icon;
  final double temperatureFontSize;
  final double iconScale;

  const WeatherCard({Key key, this.title, this.temperature, this.icon, this.temperatureFontSize = 32, this.iconScale = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        // Добавляем отступы
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Выравниваем по центру
            children: [
              Text(this.title),
              Image.network("https://openweathermap.org/img/wn/${this.icon}@2x.png", scale: this.iconScale),
              Text(
                '${this.temperature}°',
                style: TextStyle(fontSize: this.temperatureFontSize, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}