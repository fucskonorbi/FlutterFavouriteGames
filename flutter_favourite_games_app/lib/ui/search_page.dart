import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: const Text('Let\'s go'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('See favourites'),
            ),
          ],
        ),
      ),
    );
  }
}
