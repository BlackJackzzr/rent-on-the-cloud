import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/info/data.dart';
import 'package:hospitality_rental/pages/home/info/item_widget.dart';

class Info extends StatelessWidget {
  final bool showTitle;
  final List<InfoItem> dataList;

  const Info({super.key, this.showTitle = false, this.dataList = infoData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (showTitle)
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              '最新资讯',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        Column(
          children: dataList.map((item) => ItemWidget(item)).toList(),
        )
      ],
    );
  }
}
