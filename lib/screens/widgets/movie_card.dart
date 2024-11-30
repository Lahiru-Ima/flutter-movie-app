import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.isFavorite,
  });

  final MovieModel movie;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ListTile(
        leading: movie.poster!.isNotEmpty
            ? Image.network(movie.poster!)
            : const Placeholder(
                fallbackHeight: 100,
              ),
        title: Text(movie.title!),
        subtitle: Text(movie.year!),
        trailing: IconButton(
            onPressed: () {
              movieProvider.toggleFavorite(movie.imdbId!);
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border)),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movie: movie),
              ));
        },
      ),
    );
  }
}
