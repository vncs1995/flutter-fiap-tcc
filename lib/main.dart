import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex/screens/TabNavigation.dart';


main() async {
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Bem-vindo a sua pokedex!',
      home: TabNavigator(),
    );
  }
}
