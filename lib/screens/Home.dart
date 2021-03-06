import 'package:flutter/material.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/screens/PokemonDetails.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Encontre pokemons!")
      ),
      body: Container(
        child: FutureBuilder(
        future: PokemonRepository().getPokemons(),
        builder: (context, snapshot){
          if(snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ) 
            );
          } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
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
