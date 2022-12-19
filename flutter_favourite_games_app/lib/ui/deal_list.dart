import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_favourite_games_app/data/network/dio_cheapshark_service.dart';
import 'package:flutter_favourite_games_app/domain/deal_interactor.dart';
import 'package:flutter_favourite_games_app/di/di.dart';
import 'package:flutter_favourite_games_app/ui/components/custom_listitem.dart';

import '../blocs/searched_deals/searched_deals_bloc.dart';

class DealList extends StatelessWidget {
  final String title;

  const DealList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
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
              return ListView.builder(
                itemCount: state.deals.length,
                itemBuilder: (context, index) {
                  final deal = state.deals[index];
                  return CustomListItem(
                    title: deal.name,
                    subtitle: "\$${deal.price.toString()}",
                    favorite: deal.favorite,
                    onPressed: () {
                      BlocProvider.of<SearchedDealsBloc>(context)
                          .add(SearchedDealsFavouriteTapEvent(deal));
                      BlocProvider.of<SearchedDealsBloc>(context)
                          .add(SearchedDealsSearchEvent(title));
                    },
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
