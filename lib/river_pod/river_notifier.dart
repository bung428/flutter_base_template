import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RiverNotifier<T> extends StateNotifier<T> {
  BuildContext Function()? _onBuildContext;

  RiverNotifier(super.state);

  void onInit();

  BuildContext? get buildContext {
    if (_onBuildContext != null) {
      return _onBuildContext!();
    }
    return null;
  }

  void setOnBuildContext(BuildContext Function()? onBuildContext) {
    _onBuildContext = onBuildContext;
  }

  @override
  void dispose() {
    _onBuildContext = null;
    super.dispose();
  }
}