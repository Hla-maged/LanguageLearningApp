import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Phrase {
  String estatement;
  String jstatement;
  String sound;
  Phrase(
      {required this.estatement,
      required this.sound,
      required this.jstatement});
}

class phrases_page extends StatelessWidget {
  final List<Phrase> phrases = [
    Phrase(
        estatement: 'Do not forget to subscribe.',
        jstatement: 'Wasurezu ni kōdoku shite kudasai',
        sound: 'sounds/phrases/dont_forget_to_subscribe.wav'),
    Phrase(
        estatement: 'Where are you going?',
        jstatement: 'Doko ni iku no?',
        sound: 'sounds/phrases/where_are_you_going.wav'),
    Phrase(
        estatement: 'What is your name?',
        jstatement: 'Anata no namae wa nanidesu ka?',
        sound: 'sounds/phrases/what_is_your_name.wav'),
    Phrase(
        estatement: 'Are you coming?',
        jstatement: 'Kimasu ka?',
        sound: 'sounds/phrases/are_you_coming.wav'),
    Phrase(
        estatement: 'Yes i am coming.',
        jstatement: 'Hai, kimasu.',
        sound: 'sounds/phrases/yes_im_coming.wav'),
    Phrase(
        estatement: 'I love anime.',
        jstatement: 'Watashi wa anime ga daisukidesu.',
        sound: 'sounds/phrases/i_love_anime.wav'),
    Phrase(
        estatement: 'Programming is easy.',
        jstatement: 'Puroguramingu wa kantandesu.',
        sound: 'sounds/phrases/programming_is_easy.wav'),
    Phrase(
        estatement: 'How are you feeling?',
        jstatement: 'Go kibun wa ikagadesu ka?',
        sound: 'sounds/phrases/how_are_you_feeling.wav'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff977F58),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 211, 193, 163),
          title: Text(
            'Phrases',
            style: TextStyle(fontSize: 22, color: Colors.black),
          )),
      body: ListView.builder(
          itemCount: phrases.length,
          itemBuilder: (context, index) {
            return ItemP(phrase: phrases[index]);
          }),
    );
  }
}

class ItemP extends StatelessWidget {
  final Phrase phrase;
  const ItemP({
    super.key,
    required this.phrase,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Color(0xff977F58),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  phrase.estatement,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  phrase.jstatement,
                  style: TextStyle(fontSize: 15, color: Colors.white),
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
                  player.play(AssetSource(phrase.sound));
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
