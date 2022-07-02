import 'package:flutter/material.dart';
import 'package:ny_times/features/most_popular_articles/presentation/screens/articles_main_screen/articles_main_screen.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NY TIMES',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ArticlesMainScreen(),
    );
  }
}
