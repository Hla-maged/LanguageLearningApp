// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:project/models/weather_model.dart';
// import 'package:project/provider/weatherProvider.dart';
// import 'package:project/services/weather_service.dart';
// import 'package:provider/provider.dart';

// class SearchPage extends StatelessWidget {
//   String? CityName;
//   SearchPage({required this.updateUi});
//   VoidCallback? updateUi;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Search a City',
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: Colors.blue,
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 14),
//             child: TextField(
//               onChanged: (value) {
//                 CityName = value;
//               },
//               onSubmitted: (value) async {
//                 CityName = value;
//                 Weather Service = Weather();
//                 WeatherModel? weather =
//                     await Service.getWeather(CityName: CityName!);

//                 Provider.of<WeatherProvider>(context, listen: false).DATA =
//                     weather;
//                 Provider.of<WeatherProvider>(context, listen: false).CityName =
//                     CityName;
//                 Navigator.pop(context);
//               },
//               decoration: InputDecoration(
//                 label: Text('Search'),
//                 hintText: 'Enter City Name',
//                 border: OutlineInputBorder(),
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 32, horizontal: 24),
//                 suffixIcon: GestureDetector(
//                   onTap: () async {
//                     Weather Service = Weather();
//                     WeatherModel? Wmodel =
//                         await Service.getWeather(CityName: CityName!);

//                     Provider.of<WeatherProvider>(context, listen: false).DATA =
//                         Wmodel;
//                     Provider.of<WeatherProvider>(context, listen: false)
//                         .CityName = CityName;
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ),
//           ),
//         )
//         );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/provider/weatherProvider.dart';
import 'package:project/services/weather_service.dart';
import 'package:provider/provider.dart';

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
              CityName = data;

              WeatherService service = WeatherService();

              WeatherModel? weather =
                  await service.getWeather(CityName: CityName!);

              Provider.of<WeatherProvider>(context, listen: false).DATA =
                  weather;
                           Provider.of<WeatherProvider>(context, listen: false).CityName =
                               CityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                        await service.getWeather(CityName: CityName!);

                    Provider.of<WeatherProvider>(context, listen: false).DATA =
                        weather;
                                  Provider.of<WeatherProvider>(context, listen: false)
                                      .CityName = CityName;

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
