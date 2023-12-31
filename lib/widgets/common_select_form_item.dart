import 'package:flutter/material.dart';
import 'package:hospitality_rental/utils/common_picker/index.dart';
import 'package:hospitality_rental/widgets/common_form_item.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String label;
  final List<String>? options;
  final int? value;
  final ValueChanged<int?>? onChange;

  const CommonSelectFormItem({
    super.key,
    required this.label,
    this.options,
    this.value,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            var result = CommonPicker.showPicker(
              context: context,
              options: options,
              value: value,
            );
            result?.then((selectValue) {
              if (value != selectValue &&
                  selectValue != null &&
                  onChange != null) onChange!(selectValue);
            });
          },
          child: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  options![value!],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
        );
      },
    );
  }
}
