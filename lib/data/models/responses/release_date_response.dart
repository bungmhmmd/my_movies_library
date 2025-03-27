class ReleaseDateResponse {
  final dynamic day;
  final int? month;
  final int year;
  final String typename;

  ReleaseDateResponse({
    required this.day,
    required this.month,
    required this.year,
    required this.typename,
  });

  factory ReleaseDateResponse.fromJson(Map<String, dynamic> json) =>
      ReleaseDateResponse(
        day: json["day"] ?? 0,
        month: json["month"] ?? 0,
        year: json["year"] ?? 0,
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
    "day": day,
    "month": month,
    "year": year,
    "__typename": typename,
  };
}
