import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter_project/core/config/routes.dart';

import 'core/style/theme.dart';
import 'core/widgets/configuration_wrapper.dart';
import 'features/settings/providers/language_provider.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    final locale = Locale(language);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: routes,
      locale: locale,
      localizationsDelegates: [
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
            basePath: 'assets/translations',
            forcedLocale: locale,
          ),
        ),
      ],
      home: const ConfigurationWrapper(),
    );
  }
}
