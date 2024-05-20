import 'package:project/models/weather_model.dart';

class WeatherState {}

class WloadedState extends WeatherState {
  final WeatherModel DATA;
  WloadedState({required this.DATA});
}

class WfailureState extends WeatherState {
  final String error;
  WfailureState({required this.error});
}

class NoweatherState extends WeatherState {}
