import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter_project/core/models/movie.dart';
import 'package:riverpod_starter_project/core/repositories/interfaces/i_movies_api_remote_repository.dart';
import 'package:riverpod_starter_project/injection_container.dart';

final moviesProvider = FutureProvider<List<Movie>>((ref) async {
  final repository = getIt<IMoviesApiRemoteRepository>();
  final result = await repository.getMovies();

  return result;
});
