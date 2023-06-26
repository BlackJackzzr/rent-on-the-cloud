import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_profile/function_button_data.dart';
import 'package:hospitality_rental/pages/home/tab_profile/function_button_widget.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1,
      runSpacing: 1,
      children: list
          .map((item) => FunctionButtonWidget(item)).toList(),
    );
  }
}
