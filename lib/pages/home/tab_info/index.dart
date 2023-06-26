import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/info/index.dart';
import 'package:hospitality_rental/widgets/search_bar/index.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key? key}) : super(key: key);

  @override
  State<TabInfo> createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          inputValue: '',
          onSearch: () {
            Navigator.pushNamed(context, 'search');
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        children: const <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 10.0)),
          Info(),
          Info(),
          Info(),
        ],
      ),
    );
  }
}
