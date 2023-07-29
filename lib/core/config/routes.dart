import 'package:riverpod_starter_project/features/movie_search/views/movies_search_page.dart';
import 'package:riverpod_starter_project/features/number_counter/views/counter_page.dart';
import 'package:riverpod_starter_project/features/settings/views/settings_page.dart';

final routes = {
  CounterPage.routeName: (context) => const CounterPage(),
  SettingsPage.routeName: (context) => const SettingsPage(),
  MoviesSearchPage.routeName: (context) => const MoviesSearchPage(),
};
