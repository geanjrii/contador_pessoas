// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isEnabled,
    required this.label,
    required this.onPressed,
  });

  final bool isEnabled;

  final String label;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnabled ? null : onPressed,
      style: TextButton.styleFrom(
        backgroundColor:
            isEnabled ? Colors.white.withOpacity(0.2) : Colors.white,
        fixedSize: const Size(100, 100),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
