part of 'search_movies_bloc.dart';

sealed class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}

class SearchMoviesTitleEvent extends SearchMoviesEvent {
  final String title;

  const SearchMoviesTitleEvent({required this.title});

  @override
  List<Object> get props => [title];
}
