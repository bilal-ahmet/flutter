import 'package:flutter/material.dart';
import 'package:flutter_pokedex/widgets/app_title.dart';

import 'package:flutter_pokedex/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            Expanded(child:  PokemonList()),
          ],
        ),
      ),
    );
  }
}
