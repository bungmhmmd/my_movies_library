import 'package:flutter/material.dart';
import 'package:my_movies_library/core/services/movies_service.dart';
import 'package:my_movies_library/data/repositories/movies_repository.dart';
import 'package:my_movies_library/presentation/blocs/movie_bloc/movies_bloc.dart';
import 'package:my_movies_library/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(
          create: (context) => MoviesRepository(moviesService: MoviesService()),
        ),
        BlocProvider(
          create:
              (context) => MoviesBloc(
                moviesRepository: context.read<MoviesRepository>(),
              ),
        ),
      ],
      child: MaterialApp(title: 'My Movies Library', home: const HomePage()),
    );
  }
}
