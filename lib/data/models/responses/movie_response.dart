import 'package:my_movies_library/data/models/responses/primary_image_response.dart';
import 'package:my_movies_library/data/models/responses/release_date_response.dart';
import 'package:my_movies_library/data/models/responses/release_year_response.dart';
import 'package:my_movies_library/data/models/responses/title_text_response.dart';
import 'package:my_movies_library/data/models/responses/title_type_response.dart';

class MovieResponse {
  final String id;
  final String resultId;
  final PrimaryImageResponse? primaryImage;
  final TitleTypeResponse titleType;
  final TitleTextResponse titleText;
  final ReleaseYearResponse releaseYear;
  final ReleaseDateResponse? releaseDate;

  MovieResponse({
    required this.id,
    required this.resultId,
    required this.primaryImage,
    required this.titleType,
    required this.titleText,
    required this.releaseYear,
    required this.releaseDate,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
    id: json["_id"],
    resultId: json["id"],
    primaryImage:
        json["primaryImage"] == null
            ? null
            : PrimaryImageResponse.fromJson(json["primaryImage"]),
    titleType: TitleTypeResponse.fromMap(json["titleType"]),
    titleText: TitleTextResponse.fromMap(json["titleText"]),
    releaseYear: ReleaseYearResponse.fromMap(json["releaseYear"]),
    releaseDate:
        json["releaseDate"] == null
            ? null
            : ReleaseDateResponse.fromJson(json["releaseDate"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": resultId,
    "primaryImage": primaryImage?.toJson(),
    "titleType": titleType.toJson(),
    "titleText": titleText.toJson(),
    "releaseYear": releaseYear.toJson(),
    "releaseDate": releaseDate?.toJson(),
  };
}
