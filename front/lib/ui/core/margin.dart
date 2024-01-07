import 'package:flutter/material.dart';

class Margin extends StatelessWidget {
  final int heightMultiplyer;
  const Margin({super.key, this.heightMultiplyer = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (4 * heightMultiplyer).toDouble(),
    );
  }
}
