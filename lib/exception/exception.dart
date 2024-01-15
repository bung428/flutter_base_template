import 'package:dio/dio.dart';
import 'package:flutter_base_template/widget/dialog/app_dialog.dart';

Future<void> showExceptionBuilder(Object e) async {
  if (e is DioException) {
    print('exception type: ${e.type} : msg : ${e.message}');
    return appErrorDialog(null, e.toString());
  }
}