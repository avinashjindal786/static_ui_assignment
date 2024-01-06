import 'package:flutter/material.dart';

class CustomPositioned extends StatelessWidget {
  final int leftvalue;
  const CustomPositioned({super.key, required this.leftvalue});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftvalue.toDouble(),
      child: Container(
        width: 40,
        height: 40,
        child: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/image2.jpeg'),
        ),
      ),
    );
  }
}
