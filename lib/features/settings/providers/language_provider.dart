import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super("en");

  final supportedLanguages = ['fr', 'en'];

  void updateLanguage(String? language) {
    if (language != null) {
      state = language;
    }
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) => LanguageNotifier());
