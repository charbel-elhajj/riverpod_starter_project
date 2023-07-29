import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
