import 'package:charmin/store/store_color.dart';
import 'package:flutter/material.dart';

singleBtnDialog({required String message, VoidCallback? callback}) {
  return AlertDialog(
    content: Text(
      message,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: ColorStore.dialogBackgroundColor,
    actions: [
      Center(
        child: ElevatedButton(
          onPressed: callback,
          child: const Text("확인"),
        ),
      )
    ],
  );
}
