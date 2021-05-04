import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/widgets/icon_button_text.dart';

class PokemonDetailsScreen extends StatefulWidget {
  PokemonDetailsScreen({Key key, this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  State<StatefulWidget> createState() => new _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetailsScreen> {
  final box = GetStorage();

  @override
  Widget build(context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            widget.pokemon.name,
          ),
        ),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Center(
            child: Column(
              children: [
                Image.network(
                  widget.pokemon.hqImage,
                  height: 200,
                  alignment: Alignment.center,
                ),
                IconButtonWithText(
                  onPressed: () {
                    List<String> capturedPokemonsURL = box.read('captured');

                    capturedPokemonsURL.add(widget.pokemon.url);
                    box.write('captured', capturedPokemonsURL);
                  },
                )
              ],
            ),
          )
        ]));
  }
}
