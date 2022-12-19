import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_favourite_games_app/blocs/favourited/favourited_bloc.dart';
import 'package:flutter_favourite_games_app/di/di.dart';
import 'package:flutter_favourite_games_app/ui/components/custom_button.dart';
import 'package:flutter_favourite_games_app/ui/components/custom_listitem.dart';
import 'package:flutter_favourite_games_app/ui/deal_list.dart';

import 'components/buttons_select.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<FavouritedBloc>(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: BlocBuilder<FavouritedBloc, FavouritedState>(
            builder: (context, state) {
              if (state is Loading) {
                BlocProvider.of<FavouritedBloc>(context)
                    .add(const LoadFavouritesEventSortedLow());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: ButtonSelectionWidget(state.isSortedHigh),
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
                                        .add(FavouriteTapEvent(
                                            deal, state.isSortedHigh));
                                  }),
                            );
                          },
                        ),
                      ),
                      CustomButton(
                        color: Theme.of(context).primaryColor,
                        text: "Go back to search",
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
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
