import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services.locator.dart';
import 'package:movies_app/movies/presentation/screens/movies.screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
