import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/index.dart';
import 'package:hospitality_rental/pages/login.dart';
import 'package:hospitality_rental/pages/not_found.dart';
import 'package:hospitality_rental/pages/register.dart';
import 'package:hospitality_rental/pages/room_add/index.dart';
import 'package:hospitality_rental/pages/room_detail/index.dart';
import 'package:hospitality_rental/pages/settings.dart';

import 'pages/room_manage/index.dart';


class Routes{
  static String home = '/';
  static String login = '/login';
  static String roomDetail = '/roomDetail/:roomId';
  static String register = '/register';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';

  static final Handler _roomAddHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params){
    return RoomAddPage();
  });

  static final Handler _roomManageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params){
    return const RoomManagePage();
  });

  static final Handler _settingHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params){
    return const SettingPage();
  });

  static final Handler _homeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params){
    return const HomePage();
  });

  static final Handler _loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params){
    return const LoginPage();
  });

  static final Handler _notFoundHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params){
    return const NotFoundPage();
  });

  static final Handler _roomDetailHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params){
    return RoomDetailPage(roomId: params['roomId'][0]);
  });

  static final Handler _registerHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params){
    return const RegisterPage();
  });

  static void configureRoutes(FluroRouter router){
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}