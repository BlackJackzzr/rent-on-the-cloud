import 'package:flutter/material.dart';

class CommonFloatingActionButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const CommonFloatingActionButton(this.title, this.onTap, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap(),
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}