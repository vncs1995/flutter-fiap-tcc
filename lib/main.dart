import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/screens/PokemonDetails.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bem-vindo a sua pokedex!',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bem vido a sua pokedex!")
      ),
      body: Container(
        child: FutureBuilder(
        future: PokemonRepository().getPokemons(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ) 
            );
          } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data[index].image),
                  backgroundColor: Colors.white
                ),
                title: Text(snapshot.data[index].name),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => PokemonDetailsScreen(pokemon: snapshot.data[index],)));
                },
              );
            },
          );
          }
        }
      )
      )
    );
  }
}
