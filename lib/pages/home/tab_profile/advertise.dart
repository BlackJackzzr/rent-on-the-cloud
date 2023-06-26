import 'package:flutter/material.dart';
import 'package:hospitality_rental/widgets/common_image.dart';

class Advertisement extends StatelessWidget{
  const Advertisement({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10,bottom: 20),
      child: const CommonImage(
          'https://tva1.sinaimg.cn/large/006y8mN6ly1g6te62n8f4j30j603vgou.jpg',
      ),
    );
  }
}