import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:hospitality_rental/pages/home/info/index.dart';
import 'package:hospitality_rental/pages/home/tab_index/index_navigator.dart';
import 'package:hospitality_rental/pages/home/tab_index/index_recommend.dart';
import 'package:hospitality_rental/widgets/common_swiper.dart';
import 'package:hospitality_rental/widgets/search_bar/index.dart';

class TabIndex extends StatelessWidget{
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          showLocation: true,
          showMap: true,
          inputValue: '',
          onSearch: (){
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        children: const <Widget>[
          CommonSwiper(),
          IndexNavigator(),
          IndexRecommend(),
          Info(showTitle: true,),
        ],
      ),
    );
  }
}