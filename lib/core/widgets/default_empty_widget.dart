import 'package:flutter/material.dart';

class DefaultEmptyWidget extends StatelessWidget {
  final String message;
  const DefaultEmptyWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
      ],
    );
  }
}

