// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({
    super.key,
    required this.isFull,
    required this.counter,
  });

  final bool isFull;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counter',
      style: TextStyle(
        fontSize: 100,
        color: isFull ? Colors.red : Colors.white,
      ),
    );
  }
}
