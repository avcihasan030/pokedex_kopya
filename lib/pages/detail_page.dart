import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/constants/ui_helper.dart';
import 'package:poke_dex/model/pokemon_model.dart';
import 'package:poke_dex/widgets/poke_information.dart';
import 'package:poke_dex/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;

  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? buildPortraitBody(context, pokeballImageUrl)
        : buildLandscapeBody(context, pokeballImageUrl);
  }

  Scaffold buildLandscapeBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0].toString()),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18.w,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PokeNameType(pokemon: pokemon),
                        Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? '',
                            height: 0.30.sw,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: UIHelper.getDefaultPadding(),
                        child: PokeInformation(pokemon: pokemon),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold buildPortraitBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0].toString()),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18.w,
                ),
              ),
            ),
            PokeNameType(pokemon: pokemon),
            SizedBox(height: 20.h),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 50,
                    height: 0.15.sh,
                    child: Image.asset(
                      pokeballImageUrl,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.18.sh,
                    child: PokeInformation(pokemon: pokemon),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                        tag: pokemon.id!,
                        child: CachedNetworkImage(
                          imageUrl: pokemon.img ?? '',
                          height: 0.25.sh,
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
