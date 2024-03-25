import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Number {
  final String image;
  final String ename;
  final String jname;
  final String sound;
  Number(
      {required this.image,
      required this.ename,
      required this.jname,
      required this.sound});
}

class NumbersPage extends StatelessWidget {
  final List<Number> Numbers = [
    Number(
        image: 'assets/images/numbers/number_one.png',
        ename: 'One',
        jname: 'ichi',
        sound: 'sounds/numbers/number_one_sound.mp3'),
    Number(
        image: 'assets/images/numbers/number_two.png',
        ename: 'Two',
        jname: 'ne',
        sound: 'sounds/numbers/number_two_sound.mp3'),
    Number(
        image: 'assets/images/numbers/number_three.png',
        ename: 'Three',
        jname: 'san',
        sound: 'sounds/numbers/number_three_sound.mp3'),
    Number(
        image: 'assets/images/numbers/number_four.png',
        ename: 'Four',
        jname: 'yon',
        sound: 'sounds/numbers/number_four_sound.mp3'),
    Number(
        image: 'assets/images/numbers/number_five.png',
        ename: 'Five',
        jname: 'go',
        sound: 'sounds/numbers/number_five_sound.mp3'),
    Number(
        image: 'assets/images/numbers/number_six.png',
        ename: 'Six',
        jname: 'roku',
        sound: 'sounds/numbers/number_six_sound.mp3'),
    Number(
        image: 'assets/images/numbers/number_seven.png',
        ename: 'Seven',
        jname: 'nana',
        sound: 'sounds/numbers/number_seven_sound.mp3'),
    Number(
        image: 'assets/images/numbers/number_eight.png',
        ename: 'Eight',
        jname: 'hachi',
        sound: 'sounds/numbers/number_eight_sound.mp3'),
    Number(
        image: 'assets/images/numbers/number_nine.png',
        ename: 'Nine',
        jname: 'kyuu',
        sound: 'sounds/numbers/number_nine_sound.mp3'),
    Number(
        image: 'assets/images/numbers/number_ten.png',
        ename: 'Ten',
        jname: 'juu',
        sound: 'sounds/numbers/number_ten_sound.mp3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Numbers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              )),
          backgroundColor: Color(0xff5B3107), //Color(0xff533D35),
        ),
        body: ListView.builder(
          itemCount: Numbers.length,
          itemBuilder: (context, index) {
            return ItemN(number: Numbers[index]);
          },
        ));
  }
}

class ItemN extends StatelessWidget {
  final Number number;
  const ItemN({
    super.key,
    required this.number,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Color(0xff5B3107), //Color(0xff978056),
      child: Row(
        children: [
          Container(
            child: Image.asset(number.image),
            color: Color(0xffFFF6DC),
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number.ename,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  number.jname,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: IconButton(
              onPressed: () {
                try {
                  final player = AudioPlayer();
                  player.play(AssetSource(number.sound));
                } catch (ex) {
                  print(ex);
                }
              },
              icon: Icon(
                Icons.play_arrow,
                size: 26,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
