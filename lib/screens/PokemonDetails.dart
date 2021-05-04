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
  bool isOnPokedex = false;

  _capturePokemon() {
    List<String> capturedPokemonsURL = [];

    if(box.read('captured') != null) {
      capturedPokemonsURL = box.read('captured');
    }

    capturedPokemonsURL.add(widget.pokemon.url);
    box.write('captured', capturedPokemonsURL);
    setState(() {
      isOnPokedex = true;
    });
  }

  _releasePokemon() {
    List<String> pokemonsToRelease = box.read('captured');

    pokemonsToRelease.removeAt(pokemonsToRelease.indexOf(widget.pokemon.url));
    box.write('captured', pokemonsToRelease);
    setState(() {
      isOnPokedex = false;
    });
  }

  bool _isPokemonOnPokedex() {
    List<String> capturedPokemonsURL = box.read('captured');
    if(capturedPokemonsURL != null && capturedPokemonsURL.indexOf(widget.pokemon.url) != -1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(context) {
    setState(() {
      isOnPokedex = _isPokemonOnPokedex();
    });

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
                  onPressed: () {isOnPokedex ? _releasePokemon() : _capturePokemon();},
                  title: isOnPokedex ? "Soltar este pokemon" : "Capturar!!",
                )
              ],
            ),
          )
        ]));
  }
}
