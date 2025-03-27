import 'dart:convert';

import 'package:my_movies_library/core/constants/api_properties.dart';
import 'package:my_movies_library/core/constants/api_urls.dart';
import 'package:my_movies_library/core/errors/http_error_handler.dart';
import 'package:my_movies_library/core/errors/movies_exception.dart';
import 'package:my_movies_library/data/models/responses/base_response.dart';
import 'package:http/http.dart' as http;

class MoviesService {
  Future<BaseResponse> getAllTitlesMovies() async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: moviesGetAllTitlesUrl,
      queryParameters: {'sort': 'year.decr'},
    );
    print(uri);
    try {
      final response = await http.get(
        uri,
        headers: {
          'x-rapidapi-key': xRapidAPIKey,
          'x-rapidapi-host': xRapidAPIHost,
        },
      );

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      dynamic body = jsonDecode(response.body);
      print(body);
      if (body['results'] == null) {
        throw MoviesException(body['error']);
      }
      return BaseResponse.fromJson(body);
    } catch (e) {
      rethrow;
    }
  }
}
