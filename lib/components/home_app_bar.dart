import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return  Row(
      children: [
        Text('Who are you cooking today?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: w*.07,
          height: 1
        ),),
      const Spacer()
      ],
    );
  }
}