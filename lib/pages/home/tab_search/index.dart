import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_search/dataList.dart';
import 'package:hospitality_rental/pages/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:hospitality_rental/pages/home/tab_search/filter_bar/index.dart';
import 'package:hospitality_rental/widgets/room_list_item_widget.dart';
import 'package:hospitality_rental/widgets/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const FilterDrawer(),
      appBar: AppBar(
        actions: [
          Container()
        ],
        elevation: 0,
        title: SearchBar(
          showLocation: true,
          showMap: true,
          inputValue: '',
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 41,
            child: FilterBar(),
          ),
          Expanded(
              child: ListView(
            children: dataList.map((item) => RoomListItemWidget(item)).toList(),
          ))
        ],
      ),
    );
  }
}
