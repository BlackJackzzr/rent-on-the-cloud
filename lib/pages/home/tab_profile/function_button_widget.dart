import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/tab_profile/function_button_data.dart';
import 'package:hospitality_rental/widgets/common_image.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FunctionButtonItem data;

  const FunctionButtonWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        data.onTapHandle!(context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            CommonImage(
              data.imageUrl,
              width: MediaQuery.of(context).size.width * 0.33,
              height: 50,
            ),
            Text(data.title),
          ],
        ),
      ),
    );
  }
}
