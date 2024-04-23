import 'package:flutter/material.dart';
import 'package:flutter_base_template/stream_worker.dart';
import 'package:flutter_base_template/widget/keyboard_unfocus_widget.dart';
import 'package:get/get.dart';

abstract class AppSingleGetWidget<T extends GetxController> extends StatelessWidget {
  const AppSingleGetWidget({super.key});

  T? init();

  bool outsideUnFocus() => false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
        init: init(),
        autoRemove: init() != null,
        builder: (T controller) {
          var child = appWidgetBuilder(context, controller);
          final unFocus = outsideUnFocus();
          if (unFocus) {
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

  Widget appWidgetBuilder(BuildContext context, T controller);
}