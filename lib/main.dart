import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/screens/movie_list.dart';
import 'package:provider/provider.dart';
import 'provider/movie_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieProvider(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          home: MovieList()),
    );
  }
}
