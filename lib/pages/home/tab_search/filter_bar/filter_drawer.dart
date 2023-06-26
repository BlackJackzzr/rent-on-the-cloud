import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_search/filter_bar/data.dart';
import 'package:hospitality_rental/scoped_model/room_filter.dart';
import 'package:hospitality_rental/utils/scoped_model_helper.dart';
import 'package:hospitality_rental/widgets/common_title.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    roomTypeList = dataList['roomTypeList']!;
    orientedList = dataList['orientedList']!;
    floorList = dataList['floorList']!;
    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();

    _onChange(String val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(val);
    }

    // TODO: implement build
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const CommonTitle('户型'),
            FilterDrawItem(
              list: roomTypeList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            const CommonTitle('朝向'),
            FilterDrawItem(
              list: orientedList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            const CommonTitle('楼层'),
            FilterDrawItem(
              list: floorList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawItem extends StatelessWidget {
  final List<GeneralType>? list;
  final List<String>? selectedIds;
  final ValueChanged<String>? onChange;

  const FilterDrawItem(
      {super.key,
      this.list,
      this.selectedIds,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Wrap(
        spacing: 10, // 水平间距
        runSpacing: 10, // 垂直间距
        children: list!.map((e) {
          var isActive = selectedIds!.contains(e.id);
          return GestureDetector(
            onTap: () => onChange!(e.id),
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.white,
                  border: Border.all(width: 1, color: Colors.green)),
              child: Center(
                child: Text(
                  e.name,
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.green),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
