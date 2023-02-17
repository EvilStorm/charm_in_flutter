import 'dart:io';

import 'package:charmin/network/app_exception.dart';
import 'package:charmin/router/widget/alert.dart';
import 'package:charmin/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExceptionHandler {
  void fetchErrorHandler({
    required BuildContext context,
    Exception? exception,
    VoidCallback? callback,
  }) {
    if (exception == null) {
      Print.i("e is empty");
      return;
    }
    if (exception is FetchDataException) {
      showDialog(
        context: context,
        builder: (_) => singleBtnDialog(
          message: exception.message,
          callback: () {
            Navigator.pop(context);
            callback?.call();
          },
        ),
      );
    } else if (exception is FatalException) {
      showDialog(
        context: context,
        builder: (_) => singleBtnDialog(
          message: exception.message,
          callback: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else {
              exit(0);
            }
          },
        ),
      );
    } else if (exception is NotNormalException) {
      showDialog(
        context: context,
        builder: (_) => singleBtnDialog(
          message: exception.message,
          callback: () {
            Navigator.pop(context);
          },
        ),
      );
    } else if (exception is BadRequestException) {
      showDialog(
        context: context,
        builder: (_) => singleBtnDialog(
          message: exception.message,
          callback: () {
            Navigator.pop(context);
            callback?.call();
          },
        ),
      );
    } else if (exception is UnauthorisedException) {
      showDialog(
        context: context,
        builder: (_) => singleBtnDialog(
          message: exception.message,
          callback: () {
            Navigator.pop(context);
            callback?.call();
          },
        ),
      );
    } else {
      Print.i("타입이 없ㅏ");
    }
  }
}
