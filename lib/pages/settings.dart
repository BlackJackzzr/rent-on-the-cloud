import 'package:flutter/material.dart';
import 'package:hospitality_rental/utils/common_toast.dart';

class SettingPage extends StatelessWidget{
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 20),
            child: ElevatedButton(
              onPressed: (){
                CommonToast.showToast('已经退出登录');
                Navigator.pushNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
              ),
              child: const Text(
                '退出登录',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}