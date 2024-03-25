import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({this.color, this.text,this.onTap});
  Color? color;
  String? text;
  Function ()?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
    child: Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.only(left: 16),
      alignment: Alignment.centerLeft,
      color: color,
      child: Text(
        text!,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    ),);
  }
}
