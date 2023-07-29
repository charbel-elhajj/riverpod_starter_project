import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_starter_project/core/widgets/non_dissmissibale_dialog.dart';
import 'package:riverpod_starter_project/core/services/interfaces/i_connectivity_service.dart';

class ConnectivityService implements IConnectivityService {
  ConnectivityService({@visibleForTesting BuildContext? context}) {
    if (context != null) {
      _context = context;
    }
  }

  final _connectivity = Connectivity();
  late BuildContext _context;
  late ConnectivityResult _connectionStatus;
  late StreamSubscription<ConnectivityResult> _subscription;

  @override
  void initSubscription(BuildContext context) {
    _context = context;
    _subscription = _connectivity.onConnectivityChanged.listen(_handleConnectivityResult);
  }

  @override
  void cancelSubscription() {
    _subscription.cancel();
  }

  void _handleConnectivityResult(ConnectivityResult result) {
    _connectionStatus = result;
    if (!_isConnected) {
      _show(_context);
    } else {
      _hide(_context);
    }
  }

  void _show(BuildContext context) {
    if (!_isVisible) {
      _isVisible = true;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return const NonDismissibleDialog(
            title: 'connectivity_modal.title',
            content: 'connectivity_modal.content',
            assetPath: 'assets/images/png/no_connectivity.png',
          );
        },
      );
    }
  }

  void _hide(BuildContext context) {
    if (_isVisible) {
      _isVisible = false;
      Navigator.of(context).pop();
    }
  }

  bool get _isConnected => _connectionStatus != ConnectivityResult.none;
  bool _isVisible = false;
}
