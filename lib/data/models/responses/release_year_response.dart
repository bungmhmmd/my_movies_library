// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReleaseYearResponse {
  final int year;
  final dynamic endYear;

  ReleaseYearResponse({required this.year, required this.endYear});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'year': year, 'endYear': endYear};
  }

  factory ReleaseYearResponse.fromMap(Map<String, dynamic> map) {
    return ReleaseYearResponse(
      year: map['year'] as int,
      endYear: map['endYear'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReleaseYearResponse.fromJson(String source) =>
      ReleaseYearResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
