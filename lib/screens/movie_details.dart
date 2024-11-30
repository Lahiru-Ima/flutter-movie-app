import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import 'widgets/movie_details_card.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
        backgroundColor: Colors.amber,
      ),
      body: MovieDetailsCard(size: size, movie: movie),
    );
  }
}
