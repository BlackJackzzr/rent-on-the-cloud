import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:hospitality_rental/widgets/common_image.dart';

const List<String> defaultImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
  // 'https://img-blog.csdnimg.cn/img_convert/cbb8a63102cbc9c779aa3ccbfe352b37.png',
  // 'https://img-blog.csdnimg.cn/img_convert/7d196d8b3ceea128617b33296ba8e6cd.png',
  // 'https://img-blog.csdnimg.cn/img_convert/4c3424ab3c6549d610d36a9542824727.png',
  // 'https://img-blog.csdnimg.cn/img_convert/7c5b94dba308d3ac52e18271feef033b.png',
];

var imageHeight = 750.0;
var imageWidth = 424.0;

class CommonSwiper extends StatelessWidget{
  final List<String> images;
  const CommonSwiper({Key? key, this.images=defaultImages}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.width/imageHeight*imageWidth;
    return Container(
      height: height,
      child: Swiper(
        autoplay: true,
        itemBuilder: (context, int index){
          return CommonImage(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: const SwiperPagination(),
        // control: const SwiperControl(),
      ),
    );
  }
}