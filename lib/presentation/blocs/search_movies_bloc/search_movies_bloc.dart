import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movies_library/core/errors/movies_exception.dart';
import 'package:my_movies_library/data/models/responses/movie_response.dart';
import 'package:my_movies_library/data/repositories/movies_repository.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final MoviesRepository moviesRepository;
  SearchMoviesBloc({required this.moviesRepository})
    : super(SearchMoviesState.initial()) {
    on<SearchMoviesTitleEvent>((event, emit) async {
      await _searchMovies(event, emit);
    });
  }

  _searchMovies(
    SearchMoviesTitleEvent event,
    Emitter<SearchMoviesState> emit,
  ) async {
    emit(state.copyWith(status: SearchMoviesStatus.loading));

    try {
      final response = await moviesRepository.searchTitlesMovies(event.title);
      emit(
        state.copyWith(
          status: SearchMoviesStatus.success,
          movies: response.movieResponses,
        ),
      );
    } on MoviesException catch (e) {
      emit(
        state.copyWith(status: SearchMoviesStatus.failure, message: e.message),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SearchMoviesStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
