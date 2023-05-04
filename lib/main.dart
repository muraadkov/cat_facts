import 'package:cat_trivia/data/repository/store/local/cat_local_store.dart';
import 'package:cat_trivia/presentation/di/configure_dependencies.dart';
import 'package:cat_trivia/presentation/screen/cat_fact/cat_fact_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(const MyApp());
  initializeDateFormatting();
  configureDependencies();
  CatLocalStore.prepare();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat trivia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CatFactScreen(),
    );
  }
}
