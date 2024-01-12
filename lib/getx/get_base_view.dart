import 'package:flutter/material.dart';
import 'package:flutter_getx_base/stream_worker.dart';
import 'package:flutter_getx_base/widget/keyboard_unfocus_widget.dart';
import 'package:get/get.dart';

typedef GetPageBuilder<T extends GetxController> = Widget Function(
    BuildContext context, T controller);

class GetXPageBuilder<T extends GetxController> extends StatelessWidget {
  final T? init;
  final bool outsideUnFocus;
  final GetPageBuilder<T> builder;

  const GetXPageBuilder({
    super.key,
    this.init,
    this.outsideUnFocus = false,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
        init: init,
        autoRemove: init != null,
        builder: (T controller) {
          var child = builder(context, controller);
          if (outsideUnFocus) {
            child = KeyboardUnFocus(child: child);
          }

          if (controller is StreamWorker) {
            child = StreamWorkerWidget(
              worker: controller,
              child: child,
            );
          }

          return child;
        }
    );
  }
}

abstract class GetXWidget<T extends GetxController> extends StatelessWidget {
  final T controller;
  final ThemeData theme;

  ColorScheme get colorScheme => theme.colorScheme;

  // ignore: use_key_in_widget_constructors
  GetXWidget.builder(
    BuildContext context,
    this.controller,
  ) : theme = Theme.of(context);
}

abstract class LifeCycleController extends GetxController with WidgetsBindingObserver {}

mixin LifeCycle on LifeCycleController {
  @mustCallSuper
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @mustCallSuper
  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @mustCallSuper
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      case AppLifecycleState.inactive || AppLifecycleState.detached || AppLifecycleState.hidden:
        break;
    }
  }

  void onResumed() {}
  void onPaused() {}
}