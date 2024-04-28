import 'package:flutter/material.dart';
import 'package:project/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _DATA;
  String? CityName;
  set DATA(WeatherModel? weather) {
    _DATA = weather;
    notifyListeners();
  }

  WeatherModel? get DATA => _DATA;
}