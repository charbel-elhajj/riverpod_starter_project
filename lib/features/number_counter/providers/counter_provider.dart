import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void add() {
    state = state + 1;
  }

  void subtract() {
    state = state - 1;
  }

  void reset() {
    state = 0;
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());
