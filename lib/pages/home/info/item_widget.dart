import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/info/data.dart';
import 'package:hospitality_rental/widgets/common_image.dart';

var textStyle = const TextStyle(
  color: Colors.grey,
);

class ItemWidget extends StatelessWidget{
  final InfoItem data;

  const ItemWidget(this.data, {super.key});


  @override
  Widget build(BuildContext context){
    return Container(
      height: 100.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          CommonImage(
              data.imageUrl,
            height: 90.0,
            width: 120.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    data.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          data.source,
                        style: textStyle,
                      ),
                      Text(
                        data.time,
                        style: textStyle,
                      ),
                    ],
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}