import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/models/Pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> getPokemons() async {
    Dio dio = Dio();
    var response = await dio.get("https://pokeapi.co/api/v2/pokemon?limit=20&offset=0");
    List<Pokemon> pokemons = [];

    for(var pokemon in response.data["results"]) {
      var response = await dio.get(pokemon["url"]);

      var pokemonDetails = response.data;
      Pokemon _pokemon = Pokemon(name: pokemon["name"], url: pokemon["url"], image: pokemonDetails["sprites"]["front_default"], hqImage: pokemonDetails["sprites"]["other"]["official-artwork"]["front_default"]);
      pokemons.add(_pokemon);
    }

    return pokemons;
  }
}