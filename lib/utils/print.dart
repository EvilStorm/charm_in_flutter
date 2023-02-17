import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Print {
  static var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 3,
      errorMethodCount: 8,
      lineLength: 120,
      colors: Platform.isAndroid ? true : false,
      printEmojis: true,
      printTime: false,
    ),
  );

  static v(msg) {
    if (kReleaseMode) return;
    logger.v(msg);
  }

  static d(msg) {
    if (kReleaseMode) return;
    logger.d(msg);
  }

  static i(msg) {
    logger.i(msg);
  }

  static w(msg) {
    logger.w(msg);
  }

  static e(msg) {
    logger.e(msg);
  }

  static large(msg) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(msg).forEach((match) => logger.d(match.group(0)));
  }
}
