import 'package:fluttertoast/fluttertoast.dart';

class CommonToast{
  static showToast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      // web只支持TOP和BOTTOM
      gravity: ToastGravity.CENTER,
    );
  }
}