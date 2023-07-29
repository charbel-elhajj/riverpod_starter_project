import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter_project/core/models/movie.dart';

class MoviesDetailsPage extends ConsumerWidget {
  const MoviesDetailsPage({
    super.key,
    required this.movie,
  });

  static const routeName = '/movies/details';

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Text(movie.synopsis),
        ),
      ),
    );
  }
}
