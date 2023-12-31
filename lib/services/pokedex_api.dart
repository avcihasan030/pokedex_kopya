import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemoData() async {
    List<PokemonModel> _list = [];

    var response = await Dio().get(_url);
    var pokeList = jsonDecode(response.data)['pokemon'];

    if (pokeList is List) {
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    }else {
      return [];
    }

    debugPrint(_list.length.toString());

    return _list;
  }
}
