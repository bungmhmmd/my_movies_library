import 'package:my_movies_library/core/errors/movies_exception.dart';
import 'package:my_movies_library/core/services/movies_service.dart';
import 'package:my_movies_library/data/models/responses/base_response.dart';

class MoviesRepository {
  final MoviesService moviesService;

  MoviesRepository({required this.moviesService});

  Future<BaseResponse> getAllTitlesMovies() async {
    try {
      final BaseResponse baseResponse =
          await moviesService.getAllTitlesMovies();
      return baseResponse;
    } on MoviesException catch (e) {
      throw MoviesException(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
