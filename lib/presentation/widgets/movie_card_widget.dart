import 'package:flutter/material.dart';
import 'package:my_movies_library/data/models/responses/movie_response.dart';
import 'package:my_movies_library/theme_data.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieResponse movie;

  const MovieCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusSize),
        color: surfaceBColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Image.network(
        movie.primaryImage != null ? movie.primaryImage!.url : '',
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      ),
    );
  }
}
