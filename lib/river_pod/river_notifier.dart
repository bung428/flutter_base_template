import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RiverNotifier<T> extends StateNotifier<T> {
  RiverNotifier(super.state) {
    onInit();
  }

  void onInit();

  @override
  void dispose();
}