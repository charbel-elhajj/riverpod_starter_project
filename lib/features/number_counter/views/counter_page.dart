import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter_project/core/config/extensions.dart';
import 'package:riverpod_starter_project/features/movie_search/views/movies_search_page.dart';
import 'package:riverpod_starter_project/features/number_counter/providers/counter_provider.dart';
import 'package:riverpod_starter_project/features/settings/views/settings_page.dart';

class CounterPage extends ConsumerStatefulWidget {
  const CounterPage({super.key});
  static const routeName = '/counter';

  @override
  ConsumerState<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends ConsumerState<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final number = ref.watch(counterProvider);
    final provider = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('counter.title'.tr(context)),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(SettingsPage.routeName),
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(MoviesSearchPage.routeName),
            icon: const Icon(Icons.movie_creation_outlined),
          ),
        ],
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 48),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: provider.reset,
            icon: const Icon(Icons.restart_alt_rounded),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: provider.subtract,
            icon: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: provider.add,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
