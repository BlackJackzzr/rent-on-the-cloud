import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  const CommonTag.origin(this.title,
      {super.key,
      this.color=Colors.blueAccent,
      this.backgroundColor=Colors.lightBlueAccent});

  factory CommonTag(String title) {
    switch (title) {
      case '近地铁':
        return CommonTag.origin(
          title,
          color: Colors.red,
          backgroundColor: Color(0xFFFFCDD2),
        );
      case '集中供暖':
        return CommonTag.origin(
          title,
          color: Colors.lightBlueAccent,
          backgroundColor: Color(0xFFBBDEFB),
        );
      case '随时看房':
        return CommonTag.origin(
          title,
          color: Colors.green,
          backgroundColor: Color(0xFFE8F5E9),
        );
      case '新上':
        return CommonTag.origin(
          title,
          color: Colors.amberAccent,
          backgroundColor: Color(0xFFF9FBE7),
        );
      default:
        return CommonTag(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      padding: EdgeInsets.only(left: 4.0,right: 4.0,top: 2.0,bottom: 2.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(title,
      style: TextStyle(
        fontSize: 12.0,
        color: color,
      ),),
    );
  }
}
