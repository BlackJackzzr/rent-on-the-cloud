import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_index/index.dart';
import 'package:hospitality_rental/pages/home/tab_profile/index.dart';
import 'package:hospitality_rental/pages/home/tab_search/index.dart';
import 'package:hospitality_rental/widgets/page_content.dart';

import 'tab_info/index.dart';


List<Widget> tabViewList = [
  const TabIndex(),
  const TabSearch(),
  const TabInfo(),
  const TabProfile(isLogin: false),
];

List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(
    label: '首页',
    icon: Icon(Icons.home),
  ),
  const BottomNavigationBarItem(
    label: '找房',
    icon: Icon(Icons.search),
  ),
  const BottomNavigationBarItem(
    label: '资讯',
    icon: Icon(Icons.info),
  ),
  const BottomNavigationBarItem(
    label: '我的',
    icon: Icon(Icons.account_circle),
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, bool>?;
    final bool? isLogin = args != null ? args['isLogin'] : false;
    tabViewList[3] = TabProfile(isLogin: isLogin ?? false);
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}


