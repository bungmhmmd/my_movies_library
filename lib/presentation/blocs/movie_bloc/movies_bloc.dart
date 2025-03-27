import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movies_library/data/models/responses/movie_response.dart';
import 'package:my_movies_library/data/repositories/movies_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository}) : super(MoviesState.initial()) {
    on<FetchMoviesEvent>((event, emit) async {
      await _fetchMovies(event, emit);
    });
  }

  Future<void> _fetchMovies(
    FetchMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(status: MoviesStatus.loading));

    try {
      print('fetching movies');
      final response = await moviesRepository.getAllTitlesMovies();
      print('success');
      emit(
        state.copyWith(
          status: MoviesStatus.success,
          movies: response.movieResponses,
        ),
      );
    } catch (e) {
      print('bloc err: ' + e.toString());

      emit(state.copyWith(status: MoviesStatus.failure, message: e.toString()));
    }
  }
}
