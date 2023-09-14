import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/model/pokemon_model.dart';
import 'package:poke_dex/services/pokedex_api.dart';
import 'package:poke_dex/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemonListFuture = PokeApi.getPokemoData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;
          return GridView.builder(
            itemBuilder: (context, index) {
              var currentPokemon = _listem[index];
              return PokeListItem(pokemon: currentPokemon);
            },
            itemCount: _listem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text("Hata Çıktı!"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
