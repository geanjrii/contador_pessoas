// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:contador_pessoas/feature_layer/counter/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DecrementButton extends StatelessWidget {
  const DecrementButton({
    super.key,
    required this.onPressed,
    required this.isEmpty,
  });

  final void Function() onPressed;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isEnabled: isEmpty,
      label: 'Saiu',
      onPressed: onPressed,
    );
  }
}
