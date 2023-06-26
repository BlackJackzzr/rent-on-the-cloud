import 'package:flutter/material.dart';
import 'package:hospitality_rental/widgets/common_form_item.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String? label; // 标签
  final List<String>? options; //选择
  final int? value; // 值
  final ValueChanged<int?>? onChange;

  const CommonRadioFormItem({
    super.key,
    this.label,
    this.options,
    this.value,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                options!.length,
                (index) => Row(
                  children: [
                    Radio(
                      value: index,
                      groupValue: value,
                      onChanged: onChange,
                    ),
                    Text(options![index]),
                  ],
                ),),
          ),
        );
      },
    );
  }
}
