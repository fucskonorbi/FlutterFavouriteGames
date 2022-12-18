import 'dart:async';
import 'package:flutter_favourite_games_app/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final injector = GetIt.instance;

@InjectableInit()
Future configureDependencies() async => injector.init();
