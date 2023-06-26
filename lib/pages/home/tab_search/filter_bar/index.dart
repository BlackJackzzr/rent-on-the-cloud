import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_search/filter_bar/data.dart';
import 'package:hospitality_rental/pages/home/tab_search/filter_bar/item.dart';
import 'package:hospitality_rental/scoped_model/room_filter.dart';
import 'package:hospitality_rental/utils/common_picker/index.dart';
import 'package:hospitality_rental/utils/scoped_model_helper.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult>? onChange;

  const FilterBar({Key? key, this.onChange}) : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  // 搜索是否激活
  bool isAreaActive = false;
  bool isTypeActive = false;
  bool isRentPriceActive = false;
  bool isFilterActive = false;

  // 搜索内容
  String areaId = '';
  String typeId = '';
  String rentPriceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      // 设置区域选中效果
      isAreaActive = true;
    });

    var result = CommonPicker.showPicker(
      value: 0,
      context: context,
      options: areaList.map((item) => item.name).toList(),
    );

    if (result == null) return;

    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
    }).whenComplete(() {
      setState(() {
        // 取消区域选中效果
        isAreaActive = false;
      });
    });
    _onChange();
  }

  _onTypeChange(context) {
    setState(() {
      isTypeActive = true;
    });

    var result = CommonPicker.showPicker(
      value: 0,
      context: context,
      options: rentTypeList.map((item) => item.name).toList(),
    );

    if (result == null) return;

    result.then((index) {
      if (index == null) return;
      setState(() {
        typeId = rentTypeList[index].id;
      });
    }).whenComplete(() {
      setState(() {
        isTypeActive = false;
      });
    });
    _onChange();
  }

  _onRentPriceChange(context) {
    setState(() {
      isRentPriceActive = !isRentPriceActive;
    });
    var result = CommonPicker.showPicker(
        value: 0,
        context: context,
        options: priceList.map((item) => item.name).toList());

    if (result == null) return;

    result.then((index) {
      if (index == null) return;
      setState(() {
        rentPriceId = priceList[index].id;
      });
    });
    result.whenComplete(() {
      setState(() {
        isRentPriceActive = false;
      });
    });
    _onChange();
  }

  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  // 响应给父组件
  _onChange() {
    var selectedList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange!(
        FilterBarResult(
          areaId: areaId,
          rentTypeId: typeId,
          priceId: rentPriceId,
          moreId: moreIds,
          moreIds: selectedList.toList(),
        ),
      );
    }
  }

  _getData() {
    Map<String, List<GeneralType>> dataList = <String, List<GeneralType>>{};
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;

    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Item(
            title: '区域',
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          Item(
            title: '方式',
            isActive: isTypeActive,
            onTap: _onTypeChange,
          ),
          Item(
            title: '租金',
            isActive: isRentPriceActive,
            onTap: _onRentPriceChange,
          ),
          Item(
            title: '筛选',
            isActive: isFilterActive,
            onTap: _onFilterChange,
          ),
        ],
      ),
    );
  }
}

