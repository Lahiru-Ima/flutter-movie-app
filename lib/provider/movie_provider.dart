import 'package:flutter/material.dart';
import 'package:movie_app/services/movie_service.dart';

import '../models/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  final MovieService _movieService = MovieService();
  List<MovieModel> _movies = [];
  bool _isLoading = false;
  int _currentPage = 1;
  String _movieTitle = '';

  List<String> _favoriteMovies = [];

  List<MovieModel> get movies => _movies;
  List<String> get favoriteMovies => _favoriteMovies;
  bool get isLoading => _isLoading;

  Future<void> searchMovies(String title) async {
    _currentPage = 1;
    _movieTitle = title;
    _movies = [];
    await loadMovies();
  }

  Future<void> loadMoreMovies() async {
    _currentPage++;
    await loadMovies();
  }

  Future<void> loadMovies() async {
    _isLoading = true;
    notifyListeners();
    final fetchmovies =
        await _movieService.fetchMovieData(_movieTitle, _currentPage);
    _movies.addAll(fetchmovies);
    _isLoading = false;
    notifyListeners();
  }

  void toggleFavorite(String imdbId) {
    if (_favoriteMovies.contains(imdbId)) {
      _favoriteMovies.remove(imdbId);
    } else {
      _favoriteMovies.add(imdbId);
    }
    notifyListeners();
  }
}
