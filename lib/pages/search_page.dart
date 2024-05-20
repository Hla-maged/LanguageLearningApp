
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? CityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              CityName = data;
            },
            onSubmitted: (data) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(CityName:data);
              // WeatherService service = WeatherService(Dio());

              // WeatherModel? weather =
              //     await service.getWeather(CityName: CityName!);

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService(Dio());

                    WeatherModel? weather = await service.getWeather(
                        CityName:
                            CityName!); //in case we want to use this value in another view we can't use setState(),
                    // because when we convert the class to statefulwidget to update ui we can oly use setstate in this class not in another page,
                    // so we want to use another state management=> Bloc -- to control the state, seperate ui from logic
                    //- Bloc consists of "logic" => what will happen,,"states"=> to talk with the part that will change,"events"=>the action taken by user that will active the logic
                    // but we will use "Cubit" instead of bloc - we won't deal with events
                    // cubit=> handle the logic that happens and the ui that will change
                    // the steps: create states >> create cubit >> create function >> provide cubit >> integrate cubit >> trigger cubit
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
