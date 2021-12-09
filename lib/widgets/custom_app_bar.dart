import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import './search.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  final Size preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return NewGradientAppBar(
      title: Text(title),
      gradient: const LinearGradient(
        colors: [Colors.blueGrey, Colors.purple, Colors.red],
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            size: 20,
          ),
          color: Colors.white,
          onPressed: () {
            showSearch(
              context: context,
              delegate: Search(),
            );
          },
        ),
      ],
    );
  }
}
