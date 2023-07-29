import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter_project/core/models/movie.dart';
import 'package:riverpod_starter_project/features/movie_search/views/movies_details_page.dart';

class MovieTile extends ConsumerWidget {
  const MovieTile({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => MoviesDetailsPage(movie: movie),
        ),
      ),
      title: Text(movie.title),
    );
  }
}
