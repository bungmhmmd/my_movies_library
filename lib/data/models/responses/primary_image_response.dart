class PrimaryImageResponse {
  final String id;
  final int width;
  final int height;
  final String url;
  final String typename;

  PrimaryImageResponse({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.typename,
  });

  factory PrimaryImageResponse.fromJson(Map<String, dynamic> json) =>
      PrimaryImageResponse(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "width": width,
    "height": height,
    "url": url,
    "__typename": typename,
  };
}
