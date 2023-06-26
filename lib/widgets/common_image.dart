import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final networkUrlReg = RegExp('^http'); // 网络图片正则
final localUrlReg = RegExp('^static'); // 本地图片正则


class CommonImage extends StatelessWidget{
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CommonImage(
      this.src, {
        Key? key,
        this.width,
        this.height,
        this.fit,
      }) : super(key: key);

  @override
  Widget build(BuildContext context){
    if(networkUrlReg.hasMatch(src)){
      return CachedNetworkImage(
        imageUrl: src,
        width: width,
        height: height,
      );
    }
    if (localUrlReg.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
      );
    }
    assert(false, '图片地址 src 不合法');
    return Container();
  }
}