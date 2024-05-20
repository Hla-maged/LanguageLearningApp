
import 'package:dio/dio.dart';
import 'package:project/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  String baseURL = 'http://api.weatherapi.com/v1';
  String APIkey = '015033bf6c9c4e7e9f6203335242503';

  WeatherService(Dio dio);
  Future<WeatherModel> getWeather({required String CityName}) async {
    WeatherModel? weather;
    try {
      Response response = await dio.get(
          '$baseURL/forecast.json?key=$APIkey&q=$CityName&days=1'); //response
      weather = WeatherModel.fromJson(
          response.data); //take data and pass it to weathermodel
      return weather;
    } on DioException catch (e) {
      final String error =
          e.response?.data['error']['message'] ?? 'opps! there was an error';
      throw Exception(error);
    } catch (e) {
      throw Exception('there was an error');
    }
  }
}
