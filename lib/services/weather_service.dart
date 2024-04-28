import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/models/weather_model.dart';

class WeatherService {
  String baseURL = 'http://api.weatherapi.com/v1';
      String APIkey = '015033bf6c9c4e7e9f6203335242503';
  Future<WeatherModel?> getWeather({required String CityName}) async {
    WeatherModel? weather;
  
      Uri url =
          Uri.parse('$baseURL/forecast.json?key=$APIkey&q=$CityName&days=1');

      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
  
    return weather;
  }
}
