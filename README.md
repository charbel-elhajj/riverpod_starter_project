# riverpod_starter_project

A Template project for small to medium Flutter Apps using [riverpod](https://riverpod.dev/) state management.

# Project structure
```
- lib
  - core
    - config
    - models
    - repositories
      - impl
      - interfaces
    - services
      - impl
      - interfaces
    - style
    - widgets
  - features
    - example_feature
      - providers
      - views
      - widgets
  - app.dart
  - injection_container.dart
  - main.dart
  - .env
```

## `core`

In the `core` folder will be all the classes that are shared in the application like:
- `config`: The app's configuration files like `routes` and `extensions`
- `style`: The style configuration like the app's `theme` and `colors`
- `widgets`: widgets that are shared throughout the app like an error container.
- `repositories`: The classes that will query remote data sources like APIs ou local data sources like a local DB. A repository has an implementation under `impl` and an interface under `interfaces`.
- `services`: containes services that do some logic around wrapping plugins like accessing internet connection status or battery level or even firebase services like notifications. It has an implementation under `impl` and an interface under `interfaces`.

## `features`

The features folder contains the application features, and each feature contains the following folders:
- `providers`: the riverpod providers that manages the state.
- `views`: The pages of the app.
- `widgets`: The widgets composing the pages.

## Others

At the project's root you can see other files like:
- `main.dart`: That initialises basic configurations and launches the application.
- `app.dart`: containing the material app to be launched.
- `injection_container.dart`: That manages dependency injection for services and repositorties using [get_it](https://pub.dev/packages/get_it).
- `.env`: not added to the git, it is an environement file containng environement variables like api keys and tokens.

# Adding a service

In this section, we will discuss how the adding a service works. 
We will review the steps to take for adding the connection check. The goal is to block the application if there is no internet connection.

## Add the package
Add the [connectivity_plus](https://pub.dev/packages/connectivity_plus) package to you pubspec.yaml

## Create the service
Add the service that will communicate with package.
check the service's [interface](lib/core/services/interfaces/i_connectivity_service.dart) and [implementation](lib/core/services/impl/connectivity_service.dart).

## Create the popup
Create the widget blocking the app when there is no internet connection. see [non_dissmissibale_dialog.dart](lib/core/widgets/non_dissmissibale_dialog.dart)

## Inject the dependency
Add the following to the injection_container

```
Future<void> init() async {
  ...
  getIt.registerLazySingleton<IConnectivityService>(() => ConnectivityService());
  ...
}
```

## Subscribe to the service
Add the following code to the configuration wrapper (The widget used to add sunch configurations)

```
...
import 'package:riverpod_starter_project/core/services/interfaces/i_connectivity_service.dart';
...

class _ConfigurationWrapperState extends State<ConfigurationWrapper> {
  @override
  void initState() {
    ...
    getIt<IConnectivityService>().initSubscription(context);
    ...
    super.initState();
  }

  @override
  void dispose() {
    ...
    getIt<IConnectivityService>().cancelSubscription();
    ...
    super.dispose();
  }
}

```

# Adding a feature
Now let's see how to add a feature. We will add the movie search feature.
The goal is to add a page that will fetch a movie list from a remote API.

## Create the http client
If there is none, you should create a http client. check [http_client_service.dart](lib/core/services/impl/http_client_service.dart) and [i_http_client_service.dart](lib/core/services/interfaces/i_http_client_service.dart).

## Create the model
Usually when an API returns an object, it is a good idea to store it in a model, this model should be capable of serializing and deserializing to and from json.
To create the Movie model you have to:
- add the `json_annotation` and `json_serializable` packages to the pubspect.yaml
- create [movie.dart](lib/core/models/movie.dart).
- run the following command to create `movie.g.dart`
```
flutter pub run build_runner build --delete-conflicting-outputs
``` 
**Note** that this command should be ran each time a change is made to a model or a new model is created.

## Create the repository
The repository manages the http call and the deserialization from json. In this architecture each repository is linked to a data source, so we will have to create a repository for the movie api.
see [movies_api_remote_repository.dart](lib/core/repositories/impl/movies_api_remote_repository.dart) and [i_movies_api_remote_repository.dart](lib/core/repositories/interfaces/i_movies_api_remote_repository.dart).

## Inject the dependency
Add the following to the injection_container

```
Future<void> init() async {
  await dotenv.load(fileName: '.env');
  ...
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
  getIt.registerLazySingleton<IMoviesApiRemoteRepository>(
    () => MoviesApiRemoteRepository(
      client: getIt(instanceName: 'movieHttpClientService'),
    ),
  );
  ...
}

```
## Create the provider and the screens
Here, we implemented a simple logic where a loader is shown when fetching the api. On result, the list of movies is shown, and on error the error is shown.

Check the feature folder: [movie_search](lib/features/movie_search).


# Notes

The application uses [flutter_i18n](https://pub.dev/packages/flutter_i18n) for transaltion.

The application uses [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) to read the .env file.

The .env looks like that:
```
MOVIE_API_URL=https://unogsng.p.rapidapi.com
MOVIE_API_Key=
MOVIE_API_Host=
```