import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movies_library/data/models/responses/movie_response.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  SearchMoviesBloc() : super(SearchMoviesState.initial()) {
    on<SearchMoviesEvent>((event, emit) {
      _searchMovies(event, emit);
    });
  }

  _searchMovies(SearchMoviesEvent event, Emitter<SearchMoviesState> emit) {}
}
