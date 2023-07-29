import 'package:flutter/material.dart';

class NonDismissibleDialog extends StatelessWidget {
  const NonDismissibleDialog({
    required this.title,
    required this.content,
    this.assetPath,
    super.key,
  });

  final String title;
  final String content;
  final String? assetPath;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(content),
          if (assetPath != null) ...[
            const SizedBox(
              height: 24.0,
            ),
            Image(
              image: AssetImage(
                assetPath!,
              ),
              fit: BoxFit.cover,
              width: 150,
            )
          ]
        ],
      ),
    );
  }
}
