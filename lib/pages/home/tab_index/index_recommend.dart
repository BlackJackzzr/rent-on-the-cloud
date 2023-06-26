import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_index/index_recommend_data.dart';
import 'package:hospitality_rental/pages/home/tab_index/index_recommend_item_widget.dart';

class IndexRecommend extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexRecommend({super.key, this.dataList = indexRecommendData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(color: Color(0x08000000)),
      child: Column(
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '房屋推荐',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '更多',
                style: TextStyle(
                  color: Colors.grey,
                  // fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            children: dataList
                .map(
                  (item) => IndexRecommendItemWidget(item),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
