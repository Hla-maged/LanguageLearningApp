import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/pages/search_page.dart';
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
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context).DATA == null
              ? Colors.blue
              : Provider.of<WeatherProvider>(context).DATA!.getColor()),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

