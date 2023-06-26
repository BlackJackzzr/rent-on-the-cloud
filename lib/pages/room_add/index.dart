import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospitality_rental/widgets/common_floating_action_button.dart';
import 'package:hospitality_rental/widgets/common_form_item.dart';
import 'package:hospitality_rental/widgets/common_image_picker.dart';
import 'package:hospitality_rental/widgets/common_radio_form_item.dart';
import 'package:hospitality_rental/widgets/common_select_form_item.dart';
import 'package:hospitality_rental/widgets/common_title.dart';
import 'package:hospitality_rental/widgets/room_appliance.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({super.key});

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int rentType = 0;
  int decorateType = 0;
  int roomType = 0; // 户型
  int floor = 0; // 楼层
  int oriented = 0; // 朝向
  var titleController = TextEditingController(); // 描述
  var descController = TextEditingController(); // 描述
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton(
        '提交',
        () => Navigator.pushNamed(context, 'add'),
      ),
      appBar: AppBar(
        title: const Text('发布房源'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) {
              return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  // 使点击区域不只是文字或图标,还包括空白区域
                  onTap: () {
                    Navigator.pushNamed(context, 'search');
                  },
                  child: const SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '请选择小区',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ));
            },
          ),
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '大小',
            hintText: '请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          CommonRadioFormItem(
            label: '租赁方式',
            options: const [
              '合租',
              '整租',
            ],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index!;
              });
            },
          ),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (index) {
              setState(() {
                roomType = index!;
              });
            },
            options: const ['一室', '二室', '三室', '四室', '五室'],
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            onChange: (index) {
              setState(() {
                floor = index!;
              });
              ;
            },
            options: const ['高楼层', '中楼层', '低楼层'],
          ),
          CommonSelectFormItem(
            label: '朝向',
            value: oriented,
            onChange: (index) {
              setState(() {
                oriented = index!;
              });
            },
            options: const ['东', '南', '西', '北'],
          ),
          CommonRadioFormItem(
            label: '装修',
            options: const [
              '精装',
              '简装',
            ],
            value: decorateType,
            onChange: (index) {
              setState(() {
                decorateType = index!;
              });
            },
          ),
          const CommonTitle('房屋图像'),
          CommonImagePicker(
            onChange: (List<File> files) {},
          ),
          const CommonTitle('房屋标题'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: '请输入标题（例如：整组，小区名 2 室 2000 元）',
                border: InputBorder.none,
              ),
            ),
          ),
          const CommonTitle('房屋配置'),
          RoomAppliance(onChange: (data){

          },),
          const CommonTitle('房屋描述'),
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: descController,
              maxLines: 10,
              decoration: const InputDecoration(
                hintText: '请输入房屋描述信息',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
