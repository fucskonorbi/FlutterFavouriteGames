import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_favourite_games_app/data/network/dio_cheapshark_service.dart';
import 'package:flutter_favourite_games_app/domain/deal_interactor.dart';
import 'package:flutter_favourite_games_app/di/di.dart';
import 'package:flutter_favourite_games_app/ui/components/custom_listitem.dart';
import 'package:flutter_favourite_games_app/ui/favourite_page.dart';

import '../blocs/searched_deals/searched_deals_bloc.dart';
import 'components/custom_button.dart';

class DealList extends StatelessWidget {
  final String title;

  const DealList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocProvider(
          create: (context) => injector<SearchedDealsBloc>(),
          child: BlocBuilder<SearchedDealsBloc, SearchedDealsState>(
            builder: (context, state) {
              if (state is SearchedDealsLoading) {
                BlocProvider.of<SearchedDealsBloc>(context)
                    .add(SearchedDealsSearchEvent(title));
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SearchedDealsLoaded) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Text(
                          'Search results for',
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto'),
                          softWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                        child: Text(
                          "$title...",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Roboto'),
                          softWrap: true,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: state.deals.length,
                            itemBuilder: (context, index) {
                              final deal = state.deals[index];
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: CustomListItem(
                                  title: deal.name,
                                  subtitle: "\$${deal.price.toString()}",
                                  favorite: deal.favorite,
                                  onPressed: () {
                                    BlocProvider.of<SearchedDealsBloc>(context)
                                        .add(SearchedDealsFavouriteTapEvent(
                                            deal));
                                    BlocProvider.of<SearchedDealsBloc>(context)
                                        .add(SearchedDealsSearchEvent(title));
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      CustomButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FavouritePage(),
                            ),
                          );
                        },
                        text: 'See favorites',
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
