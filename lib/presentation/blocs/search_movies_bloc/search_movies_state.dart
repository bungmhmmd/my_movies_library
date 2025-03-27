// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_movies_bloc.dart';

enum SearchMoviesStatus { initial, loading, success, failure }

class SearchMoviesState extends Equatable {
  final SearchMoviesStatus status;
  final String message;
  final List<MovieResponse> movies;

  const SearchMoviesState({
    required this.status,
    required this.message,
    required this.movies,
  });

  factory SearchMoviesState.initial() {
    return const SearchMoviesState(
      status: SearchMoviesStatus.initial,
      message: '',
      movies: [],
    );
  }

  @override
  List<Object> get props => [status, message, movies];

  SearchMoviesState copyWith({
    SearchMoviesStatus? status,
    String? message,
    List<MovieResponse>? movies,
  }) {
    return SearchMoviesState(
      status: status ?? this.status,
      message: message ?? this.message,
      movies: movies ?? this.movies,
    );
  }

  @override
  bool get stringify => true;
}
