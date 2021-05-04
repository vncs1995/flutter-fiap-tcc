import 'package:dio/dio.dart';
import 'package:pokedex/models/Pokemon.dart';

class PokemonRepository {
  Dio dio = Dio();
  Future<Pokemon> _getPokemonDetails(String url) async {
    var response = await dio.get(url);

      var pokemonDetails = response.data;
       return Pokemon(
          name: pokemonDetails["name"],
          url: url,
          image: pokemonDetails["sprites"]["front_default"],
          hqImage: pokemonDetails["sprites"]["other"]["official-artwork"]
              ["front_default"]);
  }

  Future<List<Pokemon>> getPokemons() async {
    
    var response =
        await dio.get("https://pokeapi.co/api/v2/pokemon?limit=20&offset=0");
    List<Pokemon> pokemons = [];

    for (var pokemon in response.data["results"]) {
      Pokemon _pokemon = await _getPokemonDetails(pokemon["url"]);
      pokemons.add(_pokemon);
    }

    return pokemons;
  }

  Future<List<Pokemon>> getPokedex(List<String> urls) async {
    List<Pokemon> myPokemons = [];
    
    for(var url in urls) {
      Pokemon _pokemon = await _getPokemonDetails(url);
      myPokemons.add(_pokemon);
    }
    return myPokemons;
  }
}
