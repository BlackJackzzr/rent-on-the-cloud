import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget{
  final String title;
  const CommonTitle(this.title, {super.key});


  @override
  Widget build(BuildContext context){
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
    );
  }
}