import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CommonPicker {
  static Future<int?>? showPicker({
    BuildContext? context,
    List<String>? options,
    int? value = 0,
    double height = 300,
  }) {
    return showCupertinoModalPopup(
      context: context!,
      builder: (BuildContext context) {
        var controller = FixedExtentScrollController(
          initialItem: value!,
        );
        return Container(
          height: height,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '取消',
                          style: TextStyle(
                              color: Colors.green[400],
                              fontWeight: FontWeight.w700),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, controller.selectedItem);
                      },
                      child: Text(
                        '完成',
                        style: TextStyle(
                            color: Colors.green[400],
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: CupertinoPicker(
                    scrollController: controller,
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {},
                    children: options!.map((e) => Text(e)).toList(),
                  ))
            ],
          ),
        );
      },
    );
  }
}
