import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void navigateTo(Widget page) {
  Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => page,
      ));
}

enum MessageType { success, fail, warning }

void showMessage(String message, {MessageType type = MessageType.fail}) {
  if (message.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: type == MessageType.success
            ? Theme.of(navigatorKey.currentContext!).primaryColor
            : type == MessageType.warning
                ? Colors.yellow
                : Colors.red,
      ),
    );
  }
}
