import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter_project/features/settings/providers/language_provider.dart';

class LanguageDropdown extends ConsumerStatefulWidget {
  const LanguageDropdown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends ConsumerState<LanguageDropdown> {
  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    final provider = ref.watch(languageProvider.notifier);

    return DropdownButton<String>(
      value: language,
      icon: const Icon(Icons.language),
      elevation: 16,
      onChanged: provider.updateLanguage,
      items: provider.supportedLanguages.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
