import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter_project/core/config/extensions.dart';
import 'package:riverpod_starter_project/core/models/movie.dart';
import 'package:riverpod_starter_project/features/movie_search/providers/movies_provider.dart';
import 'package:riverpod_starter_project/features/movie_search/widgets/movie_tile.dart';

class MoviesSearchPage extends ConsumerWidget {
  const MoviesSearchPage({super.key});

  static const routeName = '/movies/search';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Movie>> provider = ref.watch(moviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('movie.search.title'.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: provider.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text('Error: $err'),
          data: (movies) => ListView.builder(
            itemBuilder: (_, index) => MovieTile(movie: movies[index]),
            itemCount: movies.length,
          ),
        ),
      ),
    );
  }
}
