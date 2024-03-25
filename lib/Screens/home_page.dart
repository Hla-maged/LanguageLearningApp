import 'package:flutter/material.dart';
import 'package:project/Components/category_items.dart';
import 'package:project/Screens/colors_page.dart';
import 'package:project/Screens/numbers_page.dart';
import 'package:project/Screens/family_page.dart';
import 'package:project/Screens/phrases_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor:
              Color.fromARGB(255, 232, 224, 183), //Color(0xffC8D4D0)
          appBar: AppBar(
            title: Text(
              'Tuko',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 232, 224, 183),
          ),
          body: Column(children: [
            Category(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NumbersPage();
                }));
              },
              color: Color(0xff5B3107), 
              text: 'Numbers',
            ),
            Category(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FamilyPage();
                }));
              },
              color: Color.fromARGB(255, 108, 54, 9), 
              text: 'Family Members',
            ),
            Category(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return color_page();
                }));
              },
              color: Color(0xff7E653F),
              text: 'Colors',
            ),
            Category(
              color: Color(0xff977F58),
              text: 'Prases',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return phrases_page();
                }));
              },
            ),
          ]),
        ));
  }
}
