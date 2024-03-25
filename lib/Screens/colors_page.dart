import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class mycolor {
  final String image;
  final String ename;
  final String jname;
  final String sound;
  mycolor(
      {required this.image,
      required this.ename,
      required this.jname,
      required this.sound});
}

class color_page extends StatelessWidget {
  final List<mycolor> Colorsp = [
    mycolor(
        image: 'assets/images/colors/color_white.png',
        ename: 'White',
        jname: 'Shiro',
        sound: 'sounds/colors/white.wav'),
    mycolor(
        image: 'assets/images/colors/color_black.png',
        ename: 'Black',
        jname: 'Kuro',
        sound: 'sounds/colors/black.wav'),
    mycolor(
        image: 'assets/images/colors/color_gray.png',
        ename: 'Gray',
        jname: 'Hai',
        sound: 'sounds/colors/gray.wav'),
    mycolor(
        image: 'assets/images/colors/color_green.png',
        ename: 'Green',
        jname: 'Midori',
        sound: 'sounds/colors/green.wav'),
    mycolor(
        image: 'assets/images/colors/color_red.png',
        ename: 'Red',
        jname: 'Aka',
        sound: 'sounds/colors/red.wav'),
    mycolor(
        image: 'assets/images/colors/yellow.png',
        ename: 'Yellow',
        jname: 'Kiiro',
        sound: 'sounds/colors/yellow.wav'),
    mycolor(
        image: 'assets/images/colors/color_brown.png',
        ename: 'Brown',
        jname: 'Cha',
        sound: 'sounds/colors/brown.wav'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff7E653F),
          title: Text(
            'Colors',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
            itemCount: Colorsp.length,
            itemBuilder: (context, index) {
              return ItemC(
                colorr: Colorsp[index],
              );
            }));
  }
}

class ItemC extends StatelessWidget {
  final mycolor colorr;
  const ItemC({
    super.key,
    required this.colorr,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        color: Color(0xff7E653F),
        child: Row(children: [
          Container(
            child: Image.asset(colorr.image),
            color: Color.fromARGB(255, 232, 224, 183),
          ),
          Container(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      colorr.ename,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      colorr.jname,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ])),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: IconButton(
              onPressed: () {
                try {
                  final player = AudioPlayer();
                  player.play(AssetSource(colorr.sound));
                } catch (ex) {
                  print(ex);
                }
              },
              icon: Icon(
                Icons.play_arrow,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ]));
  }
}
