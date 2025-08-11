import 'package:flutter/cupertino.dart';

Future<void> showCupertinoMessageDialog(
    BuildContext context, {
      required String title,
      required String message,
      String buttonText = "OK",
      VoidCallback? onPressed,
    }) {
  return showCupertinoDialog(
    context: context,
    builder: (ctx) => CupertinoAlertDialog(
      title: Text(title),
      content: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(message),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(buttonText),
          onPressed: () {
            Navigator.of(ctx).pop();
            if (onPressed != null) onPressed();
          },
        ),
      ],
    ),
  );
}
