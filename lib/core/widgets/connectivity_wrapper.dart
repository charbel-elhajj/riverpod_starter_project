import 'package:flutter/material.dart';
import 'package:riverpod_starter_project/features/number_counter/views/counter_page.dart';
import 'package:riverpod_starter_project/injection_container.dart';
import 'package:riverpod_starter_project/core/services/interfaces/i_connectivity_service.dart';

class ConfigurationWrapper extends StatefulWidget {
  const ConfigurationWrapper({super.key});

  @override
  State<ConfigurationWrapper> createState() => _ConfigurationWrapperState();
}

class _ConfigurationWrapperState extends State<ConfigurationWrapper> {
  @override
  void initState() {
    getIt<IConnectivityService>().initSubscription(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CounterPage();
  }

  @override
  void dispose() {
    getIt<IConnectivityService>().cancelSubscription();
    super.dispose();
  }
}
