import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/pages/search_page.dart';
import 'package:project/provider/weatherProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomePage();
}

class _HomePage extends State<Home> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? DATA;
  @override
  Widget build(BuildContext context) {
    DATA = Provider.of<WeatherProvider>(context).DATA;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage(
                      updateUi: updateUi,
                    );
                  }));
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
          title: Text('Weather App'),
        ),
        body: Provider.of<WeatherProvider>(context).DATA == null
            ? Center(
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
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  DATA!.getColor(),
                  DATA!.getColor()[300]!,
                  DATA!.getColor()[100]!
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).CityName!,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text('Updated at: ${DATA!.date}'),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(DATA!.getImage()),
                        Text(
                          '${DATA!.temp.toInt()}',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text('Max Temp : ${DATA!.maxTemp.toInt()}'),
                            Text('Min Temp : ${DATA!.minTemp.toInt()}'),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      DATA!.StateName,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 5,
                    )
                  ],
                ),
              ));
  }
}
