// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CapacityStatus extends StatelessWidget {
  const CapacityStatus({super.key, required this.isFull});

  final bool isFull;

  @override
  Widget build(BuildContext context) {
    return Text(
      isFull ? 'Lotado' : 'Pode entrar!',
      style: const TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
