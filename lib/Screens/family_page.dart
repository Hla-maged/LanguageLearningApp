import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Family {
  final String image;
  final String ename;
  final String jname;
  final String sound;
  Family(
      {required this.image,
      required this.ename,
      required this.jname,
      required this.sound});
}

class FamilyPage extends StatelessWidget {
  final List<Family> family = [
    Family(
        image: 'assets/images/family_members/family_father.png',
        ename: 'Father',
        jname: 'Chichioya',
        sound: 'sounds/family_members/father.wav'),
    Family(
        image: 'assets/images/family_members/family_mother.png',
        ename: 'Mother',
        jname: 'Hahaoya',
        sound: 'sounds/family_members/mother.wav'),
    Family(
        image: 'assets/images/family_members/family_grandfather.png',
        ename: 'GrandFather',
        jname: 'Sofu',
        sound: 'sounds/family_members/grand father.wav'),
    Family(
        image: 'assets/images/family_members/family_grandmother.png',
        ename: 'GrandMother',
        jname: 'Sobo',
        sound: 'sounds/family_members/grand mother.wav'),
    Family(
        image: 'assets/images/family_members/family_daughter.png',
        ename: 'Daughter',
        jname: 'Musume',
        sound: 'sounds/family_members/daughter.wav'),
    Family(
        image: 'assets/images/family_members/family_son.png',
        ename: 'Son',
        jname: 'Hahaoya',
        sound: 'sounds/family_members/son.wav'),
    Family(
        image: 'assets/images/family_members/family_older_brother.png',
        ename: 'Older Brother',
        jname: 'Ani',
        sound: 'sounds/family_members/older bother.wav'),
    Family(
        image: 'assets/images/family_members/family_older_sister.png',
        ename: 'Older Sister',
        jname: 'Ane',
        sound: 'sounds/family_members/older sister.wav'),
    Family(
        image: 'assets/images/family_members/family_younger_brother.png',
        ename: 'Younger Brother',
        jname: 'Otouto',
        sound: 'sounds/family_members/younger brohter.wav'),
    Family(
        image: 'assets/images/family_members/family_younger_sister.png',
        ename: 'Younger Sister',
        jname: 'Imouto',
        sound: 'sounds/family_members/younger sister.wav'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Family Members',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 108, 54, 9),
      ),
      body: ListView.builder(
          itemCount: family.length,
          itemBuilder: (context, index) {
            return ItemF(
              family: family[index],
            );
          }),
    );
  }
}

class ItemF extends StatelessWidget {
  final Family family;
  const ItemF({
    super.key,
    required this.family,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Color.fromARGB(255, 108, 54, 9),
      child: Row(
        children: [
          Container(
            child: Image.asset(family.image),
            color: Color(0xffFFF6DC),
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  family.ename,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  family.jname,
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
                  player.play(AssetSource(family.sound));
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
