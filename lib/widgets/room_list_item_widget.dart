import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_search/dataList.dart';
import 'package:hospitality_rental/widgets/common_image.dart';
import 'package:hospitality_rental/widgets/common_tag.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;

  const RoomListItemWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'roomDetail/${data.id}');
      },
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: Row(
          children: <Widget>[
            CommonImage(
              data.imageUrl,
              width: 132.5,
              height: 100.0,
            ),
            SizedBox(width: 10.0),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  data.subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Wrap(
                  children: data.tags.map((item) => CommonTag(item)).toList(),
                ),
                Text(
                  '${data.price}元/月',
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
