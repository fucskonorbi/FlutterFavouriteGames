import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_favourite_games_app/blocs/favourited/favourited_bloc.dart';

class ButtonSelectionWidget extends StatelessWidget {
  final bool rightSelected;
  const ButtonSelectionWidget(this.rightSelected, {Key? key}) : super(key: key);

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
                  color: rightSelected
                      ? Colors.white
                      : Theme.of(context).primaryColor,
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
                  color: rightSelected
                      ? Theme.of(context).primaryColor
                      : Colors.white,
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
