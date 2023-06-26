import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hospitality_rental/pages/home/index.dart';
import 'package:hospitality_rental/pages/login.dart';
import 'package:hospitality_rental/routes.dart';
import 'package:hospitality_rental/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget{
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);
    return ScopedModel(
      model: FilterBarModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.green,
            ),
        ),
        onGenerateRoute: router.generator,
      ),
    );
  }
}