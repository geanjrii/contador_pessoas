// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:contador_pessoas/data_layer/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain_layer/domain_layer.dart';
import '../feature_layer/counter/counter.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<CounterApiSharedPreferencesImp>(
            create: (context) => CounterApiSharedPreferencesImp(
                sharedPreferences: sharedPreferences)),
        RepositoryProvider<CounterRepository>(
            create: (context) => CounterRepository(
                api: context.read<CounterApiSharedPreferencesImp>())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterPage(),
      ),
    );
  }
}
