import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TitleTextResponse {
  final String text;

  TitleTextResponse({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'text': text};
  }

  factory TitleTextResponse.fromMap(Map<String, dynamic> map) {
    return TitleTextResponse(text: map['text'] as String);
  }

  String toJson() => json.encode(toMap());

  factory TitleTextResponse.fromJson(String source) =>
      TitleTextResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
