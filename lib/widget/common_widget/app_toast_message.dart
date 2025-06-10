import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class AppToast {
  static void show({
    required String message,
    ToastificationType type = ToastificationType.success,
    Duration duration = const Duration(seconds: 3),
    bool showProgressBar = false,
  }) {
    toastification.show(
      type: type,
      showProgressBar: showProgressBar,
      style: ToastificationStyle.flatColored,
      title: Text(message, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500), maxLines: 5),
      autoCloseDuration: duration,
    );
  }
}
