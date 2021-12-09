import 'package:flutter/material.dart';
import 'package:music_app/widgets/app_drawer.dart';
import 'package:music_app/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Omg'),
      ),
    );
  }
}
