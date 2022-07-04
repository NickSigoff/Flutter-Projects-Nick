import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/counter_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => CounterCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('counter'),
              ElevatedButton(onPressed: () {context.read<CounterCubit>().decrementCounter(counter)}, child: Icon(Icons.add)),
              ElevatedButton(onPressed: () {}, child: Icon(Icons.minimize))
            ],
          ),
        ),
      ),
    );
  }
}
