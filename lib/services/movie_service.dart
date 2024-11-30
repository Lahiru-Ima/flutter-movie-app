import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/models/movie_model.dart';

class MovieService {
  final Dio dio = Dio();
  final String apiUrl = 'https://www.omdbapi.com';
  final String apiKey = dotenv.env['API_KEY'].toString();

  Future<List<MovieModel>> fetchMovieData(String title, int page) async {
    try {
      final Response response =
          await dio.get('$apiUrl/?apikey=$apiKey&s=$title&page=$page');
      if (response.statusCode == 200) {
        print(response.data['Search']);
        List<dynamic> responseData = response.data['Search'];
        List<MovieModel> movies = [];

        for (var movie in responseData) {
          MovieModel movieModel = MovieModel.fromJson(movie);
          movies.add(movieModel);
        }
        return movies;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
