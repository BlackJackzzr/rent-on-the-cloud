import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_index/index_recommend.dart';
import 'package:hospitality_rental/pages/home/tab_index/index_recommend_data.dart';
import 'package:hospitality_rental/widgets/common_image.dart';

var textStyle = const TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w600,
);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommendItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(data.navigateUrl);
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width-10.0*3)/2,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                    data.title,
                  style: textStyle,
                ),
                Text(
                    data.subTitle,
                  style: textStyle,
                ),
              ],
            ),
            CommonImage(
                data.imageUrl,
              width: 55.0,
            ),
          ],
        ),
      ),
    );
  }
}
