import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {

  final String label;
  final String text;
  LabeledText(this.label, this.text);

  @override
  Widget build(BuildContext context) {
    if (text == null || text.isEmpty) return SizedBox.shrink();
    return Wrap(
      children: [
        Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold),),
        Text(text, style: TextStyle(fontWeight: FontWeight.normal),),
      ],
    );
  }
}