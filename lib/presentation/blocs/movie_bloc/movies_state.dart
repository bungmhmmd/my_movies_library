// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

enum MoviesStatus { initial, loading, success, failure }

class MoviesState extends Equatable {
  final MoviesStatus status;
  final List<MovieResponse> movies;
  final String message;

  const MoviesState({
    required this.status,
    required this.movies,
    required this.message,
  });

  factory MoviesState.initial() {
    return const MoviesState(
      status: MoviesStatus.initial,
      movies: [],
      message: '',
    );
  }

  @override
  List<Object> get props => [status, movies, message];

  MoviesState copyWith({
    MoviesStatus? status,
    List<MovieResponse>? movies,
    String? message,
  }) {
    return MoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;
}
