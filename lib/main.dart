import 'package:flutter/material.dart';
import 'package:weather/StatesEvents/WeatherEvent.dart';
import 'package:weather/StatesEvents/WeatherState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/gradient.dart';
import 'package:weather/models/Weather.dart';
import 'BLoC/WeatherBloc.dart';
import 'components/MainScreen.dart';
import 'search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColorDark: Colors.white,
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc('Saint Petersburg'),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            return Scaffold(
              appBar:
              AppBar(
                elevation: 0,
                backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: Search((query) {
                            BlocProvider.of<WeatherBloc>(context)
                                .add(WeatherRequest(city: query));
                          }));
                    },
                  )
                ],
              ),
              body: _buildGradientContainer(
                  state.weather.status,
                  Padding(
                    padding: EdgeInsets.only(top: 64),
                    child: MainScreen(
                        weather: state.weather,
                        hourlyWeather: state.hourlyWeather),
                  )),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

GradientContainer _buildGradientContainer(WeatherCondition status, Widget child) {
  GradientContainer container;
  switch (status) {
    case WeatherCondition.clear:
    case WeatherCondition.fewCloudy:
      container = GradientContainer(color: Colors.yellow, child: child);
      break;
    case WeatherCondition.cloudy:
    case WeatherCondition.fullCloudy:
    case WeatherCondition.rain:
    case WeatherCondition.mist:
      container = GradientContainer(color: Colors.indigo, child: child);
      break;
    case WeatherCondition.thunderstorm:
    case WeatherCondition.shower:
      container = GradientContainer(color: Colors.deepPurple, child: child);
      break;
    case WeatherCondition.snow:
      container = GradientContainer(color: Colors.lightBlue, child: child);
      break;
    default:
      container = GradientContainer(color: Colors.lightBlue, child: child);
  }
  return container;
}