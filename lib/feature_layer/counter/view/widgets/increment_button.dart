// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:contador_pessoas/feature_layer/counter/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({
    super.key,
    required this.isFull,
    required this.onPressed,
  });

  final bool isFull;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isEnabled: isFull,
      label: 'Entrou',
      onPressed: onPressed,
    );
  }
}
