import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_starter_project/core/repositories/impl/movies_api_remote_repository.dart';
import 'package:riverpod_starter_project/core/repositories/interfaces/i_movies_api_remote_repository.dart';
import 'package:riverpod_starter_project/core/services/impl/connectivity_service.dart';
import 'package:riverpod_starter_project/core/services/impl/http_client_service.dart';
import 'package:riverpod_starter_project/core/services/interfaces/i_connectivity_service.dart';
import 'package:riverpod_starter_project/core/services/interfaces/i_http_client_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await dotenv.load(fileName: '.env');

  getIt.registerLazySingleton<IHttpClientService>(
    instanceName: 'movieHttpClientService',
    () {
      final apiUrl = dotenv.get('MOVIE_API_URL');
      final apiKey = dotenv.get('MOVIE_API_Key');
      final apiHost = dotenv.get('MOVIE_API_Host');

      return HttpClientService(url: apiUrl, headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': apiHost,
      });
    },
  );

  getIt.registerLazySingleton<IConnectivityService>(() => ConnectivityService());
  getIt.registerLazySingleton<IMoviesApiRemoteRepository>(
    () => MoviesApiRemoteRepository(
      client: getIt(instanceName: 'movieHttpClientService'),
    ),
  );
}
