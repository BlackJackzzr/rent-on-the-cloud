import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_search/dataList.dart';
import 'package:hospitality_rental/widgets/common_floating_action_button.dart';
import 'package:hospitality_rental/widgets/room_list_item_widget.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: CommonFloatingActionButton(
            '发布房源',
            () => Navigator.pushNamed(context, 'roomAdd'),
          ),
          appBar: AppBar(
            title: Text(
              '房屋管理',
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: '空置',
                ),
                Tab(
                  text: '已租',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children:
                    dataList.map((item) => RoomListItemWidget(item)).toList(),
              ),
              ListView(
                children:
                    dataList.map((item) => RoomListItemWidget(item)).toList(),
              ),
            ],
          ),
        ));
  }
}
