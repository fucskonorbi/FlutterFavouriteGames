import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_favourite_games_app/blocs/favourited/favourited_bloc.dart';
import 'package:flutter_favourite_games_app/di/di.dart';
import 'package:flutter_favourite_games_app/ui/deal_list.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<FavouritedBloc>(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Favourite games'),
          ),
          body: BlocBuilder<FavouritedBloc, FavouritedState>(
            builder: (context, state) {
              if (state is Loading) {
                BlocProvider.of<FavouritedBloc>(context)
                    .add(const LoadFavouritesEventSortedHigh());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                return Column(
                  children: [
                    const Text('Favourite games'),
                    ButtonSelectionWidget(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.deals.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final deal = state.deals[index];
                          return ListTile(
                              title: Text(deal.name),
                              subtitle: Text(deal.price.toString()),
                              trailing: IconButton(
                                icon: Icon(Icons.favorite,
                                    color: deal.favorite
                                        ? Colors.red
                                        : Colors.grey),
                                onPressed: () {
                                  BlocProvider.of<FavouritedBloc>(context)
                                      .add(FavouriteTapEvent(deal));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        '${deal.name} was removed from your favourites'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        BlocProvider.of<FavouritedBloc>(context)
                                            .add(FavouriteTapEvent(deal));
                                      },
                                    ),
                                  ));
                                },
                              ));
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ButtonSelectionWidget extends StatelessWidget {
  const ButtonSelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              BlocProvider.of<FavouritedBloc>(context)
                  .add(const LoadFavouritesEventSortedLow());
            },
            child: const Text('Lowest price'),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<FavouritedBloc>(context)
                  .add(const LoadFavouritesEventSortedHigh());
            },
            child: const Text('Highest price'),
          ),
        ],
      ),
    );
  }
}
