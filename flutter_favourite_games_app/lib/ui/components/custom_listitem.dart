import 'package:flutter/material.dart';

import '../../domain/deal.dart';

class CustomListItem extends StatelessWidget {
  final title;
  final subtitle;
  final favorite;
  final onPressed;
  const CustomListItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.favorite,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        contentPadding: const EdgeInsets.all(20),
        title: Text(title,
            style: TextStyle(
                color: Theme.of(context).dialogBackgroundColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto')),
        subtitle: Text(subtitle,
            style: TextStyle(
                color: Theme.of(context).dialogBackgroundColor,
                fontSize: 18.0,
                fontFamily: 'Roboto')),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: favorite
                ? Theme.of(context).primaryColor
                : Theme.of(context).backgroundColor,
          ),
          child: IconButton(
            icon: Icon(Icons.star,
                color: favorite
                    ? Theme.of(context).backgroundColor
                    : Theme.of(context).primaryColor),
            onPressed: () {
              onPressed();
            },
          ),
        ));
  }
}
