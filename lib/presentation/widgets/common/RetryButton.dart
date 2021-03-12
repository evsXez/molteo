import 'package:flutter/material.dart';
import 'package:molteo/presentation/utils/Strings.dart';

class RetryButton extends StatelessWidget {

  final Function onPressed;
  RetryButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(Strings.error_retry),
      ),
    );
  }
}