import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';

class MovieDetailsCard extends StatelessWidget {
  const MovieDetailsCard({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  movie.poster!.isNotEmpty
                      ? Image.network(
                          movie.poster!,
                        )
                      : const Placeholder(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    '${movie.title}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Year: ${movie.year}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text('Type: ${movie.type}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
