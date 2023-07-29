import 'package:dio/dio.dart';
import 'package:riverpod_starter_project/core/models/movie.dart';
import 'package:riverpod_starter_project/core/repositories/interfaces/i_movies_api_remote_repository.dart';

import '../../services/interfaces/i_http_client_service.dart';

class MoviesApiRemoteRepository implements IMoviesApiRemoteRepository {
  final IHttpClientService client;

  MoviesApiRemoteRepository({required this.client});

  @override
  Future<List<Movie>> getMovies() async {
    final response = await client.get(
      RequestOptions(
        path: '/search',
        queryParameters: {
          'start_year': '1972',
          'orderby': 'rating',
          'audiosubtitle_andor': 'and',
          'limit': '100',
          'subtitle': 'english',
          'countrylist': '78,46',
          'audio': 'english',
          'country_andorunique': 'unique',
          'offset': '0',
          'end_year': '2019'
        },
      ),
    );

    final json = response.data as List<dynamic>;

    return json.map((data) => Movie.fromJson(data as Map<String, dynamic>)).toList();
  }
}
