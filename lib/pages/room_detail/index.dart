import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/info/index.dart';
import 'package:hospitality_rental/pages/room_detail/data.dart';
import 'package:hospitality_rental/widgets/common_swiper.dart';
import 'package:hospitality_rental/widgets/common_tag.dart';
import 'package:hospitality_rental/widgets/common_title.dart';
import 'package:hospitality_rental/widgets/room_appliance.dart';
import 'package:share_plus/share_plus.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;

  const RoomDetailPage({Key? key, required this.roomId}) : super(key: key);

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData data;
  bool isLike = false; // 是否收藏
  bool showAllText = false; // 是否展开
  @override
  void initState() {
    setState(() {
      data = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool showTextTool = data.subTitle.length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Share.share('https://qzone.qq.com/');
              },
              icon: const Icon(Icons.share)),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwiper(
                images: data.houseImgs,
              ),
              CommonTitle(data.title),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.price.toString(),
                      style: const TextStyle(color: Colors.pink, fontSize: 20),
                      // textAlign: TextAlign.end,
                    ),
                    const Text(
                      '元/月(押一付三)',
                      style: TextStyle(color: Colors.pink, fontSize: 14),
                      // textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, bottom: 6, top: 6),
                child: Wrap(
                  spacing: 4,
                  children: data.tags.map((e) => CommonTag(e)).toList(),
                ),
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, bottom: 6, top: 6),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    BaseInfoItem(content: '面积: ${data.size}平方米'),
                    BaseInfoItem(content: '楼层: ${data.floor}'),
                    BaseInfoItem(content: '房型: ${data.roomType}'),
                    const BaseInfoItem(content: '装修: 精装'),
                  ],
                ),
              ),
              const CommonTitle('房屋配置'),
              RoomApplianceList(list: data.applicances),
              const CommonTitle('房屋概况'),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.subTitle,
                      maxLines: showAllText ? null : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(showAllText ? '收起' : '展开'),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down),
                                  ],
                                ),
                              )
                            : Container(),
                        const Text('举报'),
                      ],
                    ),
                  ],
                ),
              ),
              const CommonTitle('猜你喜欢'),
              const Info(),
              Container(
                height: 200,
              ),
            ],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: 100,
            bottom: 0,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
              color: Colors.grey[200],
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLike = !isLike;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 40,
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            isLike ? Icons.star : Icons.star_border,
                            size: 24,
                            color: isLike ? Colors.green : Colors.black,
                          ),
                          Text(
                            isLike ? '已收藏' : '收藏',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                            child: Text(
                          '联系房东',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                            child: Text(
                          '预约看房',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;

  const BaseInfoItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
      child: Text(
        content,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
