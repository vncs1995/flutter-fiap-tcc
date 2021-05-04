import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class MyPokedexScreen extends StatelessWidget {
  final box = GetStorage();
  

  @override
  Widget build(context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Minha pokedex"),
      ),
            body: Container(
        child: FutureBuilder(
        future: PokemonRepository().getPokedex(box.read("captured")),
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
