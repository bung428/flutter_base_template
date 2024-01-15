import 'package:flutter/material.dart';
import 'package:get/get.dart';

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