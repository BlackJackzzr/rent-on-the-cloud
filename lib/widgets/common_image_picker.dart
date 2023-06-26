import 'dart:io';
import 'package:images_picker/images_picker.dart';
import 'package:flutter/material.dart';


// 设置图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; // 宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<File>> onChange;

  const CommonImagePicker({super.key, required this.onChange});

  @override
  _CommonImagePickerState createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<File> files = [];
  // final _picker = ImagePicker();

  _pickImage() async {
    // File? image = await _picker.pickImage(source: ImageSource.gallery);
    var image = await ImagesPicker.pick(
      count: 1,
      pickType: PickType.image,
    );
    if (image == null) return;
    setState(() {
      files.add(image as File);
      // 通知父级数据发生变化
      widget.onChange(files);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = width / imageWidgetHeightRatio;

    Widget addButton = GestureDetector(
      onTap: () {
        _pickImage();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: const Center(
          child: Text(
            '+',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );

    Widget wrapper(File file) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Image.file(
            File(file.path),
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: -20,
            top: -20,
            child: IconButton(
              onPressed: () {
                setState(() {
                  files.remove(file);
                  widget.onChange(file as List<File>);
                });
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    }

    List<Widget> list = files.map((item) => wrapper(item)).toList()
      ..add(addButton);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list,
      ),
    );
  }
}
