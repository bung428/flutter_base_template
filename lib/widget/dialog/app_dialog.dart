import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_base/edge_insets.dart';
import 'package:flutter_getx_base/widget/dialog/app_bottom_sheet.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

typedef DialogWidgetBuilder = Widget Function(BuildContext context);

Widget Function(BuildContext context,
    List<(dynamic result, String text, ButtonStyle? style)> actions)
buildActions = (BuildContext context,
List<(dynamic result, String text, ButtonStyle? style)> actions) {
  final actionWidget = <Widget>[];
  for (final (result, text, style) in actions) {
    if (actionWidget.isNotEmpty) {
      actionWidget.add(const SizedBox(
      width: 8,
      ));
    }
    actionWidget.add(Expanded(
      child: ElevatedButton(
      style: style,
      onPressed: () {
        Navigator.of(context).pop(result);
    },
    child: Container(
      width: double.infinity,
      height: 48,
      alignment: AlignmentDirectional.center,
      child: Text(text),
      ))));
  }

  return Row(
    children: actionWidget,
  );
};

Future<dynamic> appSimpleDialog({
  bool isDismissible = true,
  bool isScrollControlled = false,
  DialogWidgetBuilder? title,
  DialogWidgetBuilder? content,
  DialogWidgetBuilder? action,
  List<(dynamic, String, ButtonStyle?)>? actions,
}) {
  final context = Get.overlayContext!;
  return showAlertDialog(
      context: context,
      isDismissible: isDismissible,
      title: title != null ? (_) => title(_) : null,
      content: content != null ? (_) => content(_) : null,
      action: actions != null ? (_) => buildActions(context, actions)
          : action != null ? (_) => action(_)
      : null,
  );
}

Future<dynamic> showAlertDialog({
  required BuildContext context,
  bool isDismissible = true,
  WidgetBuilder? title,
  WidgetBuilder? content,
  WidgetBuilder? action,
  List<(dynamic, String, ButtonStyle?)>? actions,
}) {
  return showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        final actionWidget = action?.call(context);
        final contentWidget = content?.call(context);

        return AlertDialog(
          title: title?.call(context),
          content: contentWidget != null ? SingleChildScrollView(child: contentWidget,) : null,
          actions: actionWidget != null ? [actionWidget] : null,
        );
      });
}



Future<void> appErrorDialog(String? title, String? content) {
  return showAppBottomSheet(
      context: Get.overlayContext!,
      title: (context) {
        return Container(
          padding: const EdgeInsetsApp(horizontal: 16),
          child: Row(
            children: [
              Icon(
                Icons.warning_amber,
                color: Theme.of(context).colorScheme.error,
              ),
              const Gap(8),
              Expanded(
                child: Text(
                  title ?? '',
                ),
              )
            ],
          ),
        );
      },
      content: (context) {
        if (content == null) {
          return const Gap(16);
        }

        return Container(
          padding: const EdgeInsetsApp(horizontal: 16, vertical: 16),
          child: Text(content),
        );
      },
      actions: [(null, 'confirm'.tr, null)]);
}
