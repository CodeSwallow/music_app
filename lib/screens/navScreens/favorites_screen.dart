import 'package:flutter/material.dart';
import 'package:music_app/widgets/app_drawer.dart';
import 'package:music_app/widgets/custom_app_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static const routeName = '/favorites_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Favorites'),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Favorites Screen'),
      ),
    );
  }
}
