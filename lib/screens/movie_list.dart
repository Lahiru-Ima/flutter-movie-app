import 'package:flutter/material.dart';
import 'package:movie_app/screens/widgets/movie_card.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.02),
            child: SearchBar(
              hintText: 'Search Movies',
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              trailing: const [Icon(Icons.search)],
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  movieProvider.searchMovies(value);
                }
              },
            ),
          ),
          Expanded(
            child: movieProvider.movies.isEmpty
                ? const Center(
                    child: Text('No Movies Found'),
                  )
                : movieProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          if (index == movieProvider.movies.length) {
                            return movieProvider.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          movieProvider.loadMoreMovies();
                                        },
                                        child: const Center(
                                            child: Text('Load More'))),
                                  );
                          }
                          final movie = movieProvider.movies[index];
                          final isFavorite = movieProvider.favoriteMovies
                              .contains(movie.imdbId);
                          return MovieCard(
                              movie: movie, isFavorite: isFavorite);
                        },
                        itemCount: movieProvider.movies.length + 1,
                      ),
          ),
        ],
      ),
    );
  }
}
