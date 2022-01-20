import 'package:flutter/material.dart';
import 'package:music_app/widgets/app_drawer.dart';
import 'package:music_app/widgets/custom_app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeName = '/search_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Search'),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
