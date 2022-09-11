import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void ShowSnakBar({required String message, bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red.shade700 : Colors.blue.shade300,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        // padding: EdgeInsets.all(20),
        elevation: 10,
        // dismissDirection: DismissDirection.vertical,
        dismissDirection: DismissDirection.horizontal,
        action: SnackBarAction(
          label: 'delete',
          onPressed: () {},
          textColor: Colors.white,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
