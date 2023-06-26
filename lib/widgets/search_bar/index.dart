import 'package:flutter/material.dart';
import 'package:hospitality_rental/widgets/common_image.dart';

class SearchBar extends StatefulWidget {
  final bool? showLocation; //是否显示位置
  final Function? goBackCallback; //回退
  final String inputValue; //搜索框值
  final String defaultInputValue; //默认显示值
  final Function? onCancel; //取消按钮
  final bool? showMap; //是否显示地图按钮
  final Function? onSearch; //点击搜索框触发
  final ValueChanged<String>? onSearchSubmit; // 点击回车触发

  const SearchBar(
      {Key? key,
      this.showLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  late FocusNode _focus;
  void _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  @override
  void initState() {
    _controller = TextEditingController(text: widget.inputValue);
    _focus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (widget.showLocation != null)
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.room,
                    color: Colors.green,
                    size: 16.0,
                  ),
                  Text(
                    '北京',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 10.0),
          if (widget.goBackCallback != null)
            GestureDetector(
              onTap:
                  (widget.goBackCallback ?? () {}) as GestureTapCallback, // 强转
              child: const Icon(
                Icons.chevron_left,
                color: Colors.black87,
              ),
            ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Container(
              height: 34.0,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17.0)),
              child: TextField(
                focusNode: _focus,
                onTap: (){
                  if (widget.onSearchSubmit == null) {
                    _focus.unfocus(); // 不是搜索页则失去焦点
                  }
                  if (widget.onSearch != null) {
                    widget.onSearch!();
                  }
                },
                onSubmitted: widget.onSearchSubmit,
                textInputAction: TextInputAction.search,
                controller: _controller,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
                onChanged: (String value){
                  setState(() {
                    _searchWord = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 4.0, left: -10.0),
                  border: InputBorder.none,
                  hintText: '请输入搜索词',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 2.0, left: 8.0),
                    child: Icon(
                      Icons.search,
                      size: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _onClean();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 18.0,
                      color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          if (widget.onCancel != null)
            GestureDetector(
              onTap: (widget.onCancel ?? () {}) as GestureTapCallback,
              child: const Text(
                '取消',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          const SizedBox(width: 10.0),
          if (widget.showMap != null)
            const CommonImage(
              'static/icons/widget_search_bar_map.png',
              width: 40,
              height: 40,
            ),
        ],
      ),
    );
  }
}
