import 'package:flutter/material.dart';
import 'package:flutter_favourite_games_app/di/di.dart';
import 'package:flutter_favourite_games_app/ui/deal_list.dart';
import 'package:flutter_favourite_games_app/ui/search_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Deals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchPage(),
    );
  }
}
