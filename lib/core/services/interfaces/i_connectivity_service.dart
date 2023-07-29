import 'package:flutter/material.dart';

abstract class IConnectivityService {
  void initSubscription(BuildContext context);
  void cancelSubscription();
}
