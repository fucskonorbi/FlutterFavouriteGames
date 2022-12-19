import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_favourite_games_app/ui/deal_list.dart';
import 'package:flutter_favourite_games_app/ui/favourite_page.dart';

import '../blocs/searched_deals/searched_deals_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Search for game title headline
    // Search... text field
    // Let's go button
    // See favourites button
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search for game title'),
        ),
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Search...', border: OutlineInputBorder()),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DealList(title: "league")));
              },
              child: const Text('Let\'s go'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavouritePage()));
              },
              child: const Text('See favourites'),
            ),
          ],
        ),
      ),
    );
  }
}
