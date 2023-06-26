import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/info/index.dart';
import 'package:hospitality_rental/pages/home/tab_profile/advertise.dart';
import 'package:hospitality_rental/pages/home/tab_profile/function_button.dart';
import 'package:hospitality_rental/pages/home/tab_profile/header.dart';

class TabProfile extends StatelessWidget {
  final bool isLogin;
  const TabProfile({Key? key, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('我的'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('setting');
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: ListView(
        children: [
          Header(isLogin: isLogin),
          const FunctionButton(),
          const SizedBox(height: 30),
          const Advertisement(),
          const Info(showTitle: true,),
        ],
      ),
    );
  }
}
