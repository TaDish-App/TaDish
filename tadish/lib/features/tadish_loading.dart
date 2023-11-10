import 'package:flutter/material.dart';

class TadishLoading extends StatelessWidget {
  const TadishLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}