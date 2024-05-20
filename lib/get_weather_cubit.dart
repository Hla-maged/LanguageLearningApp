import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/services/weather_service.dart';

// cubit deals with all states that extends from WeatherState
// we should put the logic that will make change in cubit so the cubit know what happen
// after the logic done the cubit should talk with ui
class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? DATA;
  String? CityName;
  GetWeatherCubit() : super(NoweatherState());
  // initial state: the first state that the app take after running
  getWeather({required String CityName}) async {
    try {
      //WeatherService service = WeatherService(Dio());
      DATA =
          await WeatherService(Dio()).getWeather(CityName: CityName);

      emit(WloadedState(
         DATA: DATA!)); // tell the ui that the data come right
    } catch (e) {
      emit(WfailureState(error: e.toString()));
    }
  }
}
