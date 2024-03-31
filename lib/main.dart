import 'package:bloc/bloc.dart';
import 'package:contador_pessoas/app/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance(); 
  Bloc.observer = const AppBlocObserver();
  runApp(App(sharedPreferences: sharedPreferences));
}
