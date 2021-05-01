import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bem-vindo a sua pokedex!',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
        ),
        body: Center(child: Text('Bem vindo a sua pokedex'),),
      ),
    );
  }
}
