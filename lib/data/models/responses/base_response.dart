import 'package:my_movies_library/data/models/responses/movie_response.dart';

class BaseResponse {
  final int page;
  final String next;
  final int entries;
  final List<MovieResponse> movieResponses;

  const BaseResponse({
    required this.page,
    required this.next,
    required this.entries,
    required this.movieResponses,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
    page: json["page"],
    next: json["next"] ?? '',
    entries: json["entries"],
    movieResponses: List<MovieResponse>.from(
      json["results"].map((x) => MovieResponse.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "next": next,
    "entries": entries,
    "results": List<dynamic>.from(movieResponses.map((x) => x.toJson())),
  };
}
