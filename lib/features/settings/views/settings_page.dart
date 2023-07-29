import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter_project/core/config/extensions.dart';
import 'package:riverpod_starter_project/features/settings/widgets/language_dropdown.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr(context)),
      ),
      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: [
            Center(child: LanguageDropdown()),
          ],
        ),
      ),
    );
  }
}
