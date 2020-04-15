import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/stat_bloc.dart';
import 'data/stat_repository.dart';
import 'pages/stat_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppTeam APP',
      home: BlocProvider(
        builder: (context) => StatBloc(FakeStatRepository()),
        child: StatSearchPage(),
      ),
    );
  }
}