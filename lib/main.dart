import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_favourite_games_app/data/network/cheapshark_api.dart';
import 'package:flutter_favourite_games_app/data/network/dio_cheapshark_service.dart';
import 'package:flutter_favourite_games_app/di/di.dart';
import 'package:flutter_favourite_games_app/ui/deal_list.dart';
import 'package:flutter_favourite_games_app/ui/search_page.dart';
import 'package:flutter_favourite_games_app/ui/theme.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

const SEARCH_PAGE = '/search_page';

Future _dependencies = configureDependencies();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dependencies,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Game Deals',
          theme: theme(),
          home: const SearchPage(),
          onGenerateRoute: (settings) {
            final name = settings.name ?? '';
            if (name.startsWith(SEARCH_PAGE)) {
              return MaterialPageRoute(
                builder: (context) =>
                    DealList(title: settings.arguments.toString()),
              );
            }
          },
        );
      },
    );
  }
}
