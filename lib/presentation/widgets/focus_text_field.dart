import 'package:flutter/material.dart';

class FocusTextField extends StatelessWidget {
  final String labelText;
  final FocusNode focusNode;

  FocusTextField({
    required this.labelText,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
