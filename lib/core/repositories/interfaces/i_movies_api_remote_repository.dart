import 'package:riverpod_starter_project/core/models/movie.dart';

abstract class IMoviesApiRemoteRepository {
  Future<List<Movie>> getMovies();
}
