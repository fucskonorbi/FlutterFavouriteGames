import 'package:flutter/material.dart';
import 'package:flutter_favourite_games_app/di/di.dart';
import 'package:flutter_favourite_games_app/ui/deal_list.dart';

void main() {
  setupInjector();
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
