import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubits/get_weather_cubit/get_weather_cubit.dart';

import 'package:project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:project/provider/weatherProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // we use material app to provide cubit to both homView and searchView
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Material()
    );
  }
}

class Material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(
            primarySwatch: 
                BlocProvider.of<GetWeatherCubit>(context).DATA?.getColor()),
        debugShowCheckedModeBanner: false,
        home: Home(),
    );
  }
}

