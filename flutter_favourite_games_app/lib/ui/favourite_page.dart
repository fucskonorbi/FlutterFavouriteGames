import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favourite games'),
        ),
        body: BlocBuilder<FavouriteDealsBloc, FavouriteDealsState>(
          builder: (context, state) {
            if (state is FavouriteDealsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FavouriteDealsLoaded) {
              return DealList(
                deals: state.deals,
                title: 'Favourite games',
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),
    );
  }
}
