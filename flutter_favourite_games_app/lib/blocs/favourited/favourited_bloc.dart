import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourited_event.dart';
part 'favourited_state.dart';

class FavouritedBloc extends Bloc<FavouritedEvent, FavouritedState> {
  FavouritedBloc() : super(FavouritedInitial()) {
    on<FavouritedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
