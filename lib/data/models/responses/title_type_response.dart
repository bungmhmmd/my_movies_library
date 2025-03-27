// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TitleTypeResponse {
  final String text;
  final String id;
  final bool isSeries;
  final bool isEpisode;

  TitleTypeResponse({
    required this.text,
    required this.id,
    required this.isSeries,
    required this.isEpisode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'id': id,
      'isSeries': isSeries,
      'isEpisode': isEpisode,
    };
  }

  factory TitleTypeResponse.fromMap(Map<String, dynamic> map) {
    return TitleTypeResponse(
      text: map['text'] as String,
      id: map['id'] as String,
      isSeries: map['isSeries'] as bool,
      isEpisode: map['isEpisode'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TitleTypeResponse.fromJson(String source) =>
      TitleTypeResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
