import 'dart:io';

import 'package:flutter/foundation.dart';

String? platformName;

String getPlatormSymbol() {
  if (platformName != null) {
    return platformName!;
  }
  if (kIsWeb) {
    platformName = "W";
  } else {
    if (Platform.isAndroid) {
      platformName = "A";
    } else if (Platform.isIOS) {
      platformName = "I";
    } else if (Platform.isFuchsia) {
      platformName = "F";
    } else if (Platform.isLinux) {
      platformName = "L";
    } else if (Platform.isMacOS) {
      platformName = "M";
    } else if (Platform.isWindows) {
      platformName = "WIN";
    } else {
      platformName = "UNDEFIND";
    }
  }
  return platformName!;
}
