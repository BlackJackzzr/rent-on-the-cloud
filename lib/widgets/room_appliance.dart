import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/config.dart';
import 'package:hospitality_rental/widgets/common_check_button.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe624, false),
  RoomApplianceItem('洗衣机', 0xe67d, false),
  RoomApplianceItem('空调', 0xe90e, false),
  RoomApplianceItem('天然气', 0xe627, false),
  RoomApplianceItem('冰箱', 0xe90b, false),
  RoomApplianceItem('暖气', 0xe90d, false),
  RoomApplianceItem('电视', 0xe90a, false),
  RoomApplianceItem('热水器', 0xe609, false),
  RoomApplianceItem('宽带', 0xe7e0, false),
  RoomApplianceItem('沙发', 0xe628, false),
  RoomApplianceItem('扫地机', 0xe69c, false),
  RoomApplianceItem('风扇', 0xe694, false),
  RoomApplianceItem('洗碗机', 0xe6c6, false),
  RoomApplianceItem('阳台', 0xe625, false),
  RoomApplianceItem('加湿器', 0xe60c, false),
  RoomApplianceItem('微波炉', 0xe626, false),
];

class RoomAppliance extends StatefulWidget {
  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({super.key, required this.onChange});

  @override
  _RoomApplianceState createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 30,
        children: list
            .map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      list = list
                          .map((item) => item == e
                              ? RoomApplianceItem(
                                  e.title, e.iconPoint, !e.isChecked)
                              : item)
                          .toList();
                    });
                    widget.onChange(list);
                  },
                  behavior: HitTestBehavior.translucent,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      children: [
                        Icon(
                          IconData(e.iconPoint, fontFamily: Config.CommonIcon),
                          size: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(e.title),
                        ),
                        CommonCheckButton(isChecked: e.isChecked),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class RoomApplianceList extends StatelessWidget{
  final List<String> list;

  const RoomApplianceList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var showList= _dataList.where((element) => list.contains(element.title)).toList();
    if(showList.length==0){
      return Container(
        padding: EdgeInsets.only(left: 10),
        child: Text('暂无房屋配置信息'),
      );
    }
    return Container(
      child: Wrap(
        runSpacing: 30,
        children: showList
            .map((e) => SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                children: [
                  Icon(
                    IconData(e.iconPoint, fontFamily: Config.CommonIcon),
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(e.title),
                  ),
                ],
              ),
            ))
            .toList(),
      ),
    );
  }
}
