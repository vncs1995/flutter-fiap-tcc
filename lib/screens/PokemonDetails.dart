import 'package:flutter/material.dart';
import 'package:pokedex/models/Pokemon.dart';

class PokemonDetailsScreen extends StatefulWidget {
  PokemonDetailsScreen({Key key, this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  State<StatefulWidget> createState() => new _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print("hqImage: ${widget.pokemon.hqImage}");
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pokemon.name,
        ),
      ),
      body: Container(
          child: Stack(alignment: Alignment.center, children: <Widget>[
        Image.network(
          widget.pokemon.hqImage,
          height: 200,
          alignment: Alignment.center,
        )
      ])),
    );
  }
}
