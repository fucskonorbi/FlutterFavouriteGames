import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_favourite_games_app/blocs/favourited/favourited_bloc.dart';
import 'package:flutter_favourite_games_app/di/di.dart';
import 'package:flutter_favourite_games_app/ui/components/custom_button.dart';
import 'package:flutter_favourite_games_app/ui/components/custom_listitem.dart';
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
            title: const Text(
              'Favourite games',
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: BlocBuilder<FavouritedBloc, FavouritedState>(
            builder: (context, state) {
              if (state is Loading) {
                BlocProvider.of<FavouritedBloc>(context)
                    .add(const LoadFavouritesEventSortedHigh());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                        child: Text(
                          'Favourite games',
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto'),
                          softWrap: true,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: ButtonSelectionWidget(true),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.deals.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final deal = state.deals[index];
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: CustomListItem(
                                  title: deal.name,
                                  subtitle: "\$${deal.price.toString()}",
                                  favorite: deal.favorite,
                                  onPressed: () {
                                    BlocProvider.of<FavouritedBloc>(context)
                                        .add(FavouriteTapEvent(deal));
                                  }),
                            );
                          },
                        ),
                      ),
                      CustomButton(
                        color: Theme.of(context).primaryColor,
                        text: "Go back to search",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
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
  final bool leftSelected;
  const ButtonSelectionWidget(this.leftSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: leftSelected
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<FavouritedBloc>(context)
                        .add(const LoadFavouritesEventSortedLow());
                  },
                  child: Text('Lowest price',
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto')),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: leftSelected
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<FavouritedBloc>(context)
                        .add(const LoadFavouritesEventSortedHigh());
                  },
                  child: Text(
                    'Highest price',
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
