import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:project/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/pages/search_page.dart';

class Home extends StatelessWidget {
  WeatherModel? DATA;
  @override
  Widget build(BuildContext context) {
    // DATA = Provider.of<WeatherProvider>(context).DATA;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }));
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
          title: Text('Weather App'),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          if (state is NoweatherState) {
            return NoWeather();
          } else if (state is WloadedState) {
            DATA = BlocProvider.of<GetWeatherCubit>(context).DATA;
            return WeatherInfo();
          } else {
            return Text("opps, there was an error!");
          }
        }));
  }
}

class WeatherInfo extends StatelessWidget {
  WeatherModel? DATA;
  @override
  Widget build(BuildContext context) {
    WeatherModel DATA = BlocProvider.of<GetWeatherCubit>(context).DATA!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            (DATA.getColor()),
            (DATA.getColor())[300]!,
            (DATA.getColor())[50]!,
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 3,
          ),
          Text(
            DATA.CityName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text('Updated at: ${DATA.date}'),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("${DATA.getImage()}"),
              Text(
                '${DATA.temp.toInt()}',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('Max Temp : ${DATA.maxTemp.toInt()}'),
                  Text('Min Temp : ${DATA.minTemp.toInt()}'),
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            DATA.StateName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}

class NoWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'There is no weather ! start',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          'searching now 🔍',
          style: TextStyle(
            fontSize: 30,
          ),
        )
      ],
    ));
  }
}
