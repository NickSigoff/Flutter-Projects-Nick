import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test/pages/start_page/bloc/start_page_bloc.dart';
import 'package:weather_test/pages/start_page/start_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => StartPageBloc()),
    ],
    child: MaterialApp(
      home: StartPage(),
    ),
  ));
}
