import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/constants/constants.dart';
import 'package:poke_dex/model/pokemon_model.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeNameType({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pokemon.name.toString(),
                style: Constants.getPokemonNameTextStyle(),
              ),
              Text(
                "#00${pokemon.id}",
                style: Constants.getPokemonNameTextStyle(),
              ),
            ],
          ),
          SizedBox(height: 0.02.sh),
          Chip(
            label: Text(
              pokemon.type?.join(' , ') ?? '',
              style: Constants.getTypeChipStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
