import 'package:flutter/material.dart';

class LeftRoundedTextField extends StatelessWidget {
  const LeftRoundedTextField({
    super.key,
    required this.controller,
    required this.height,
    required this.radius,
  });

  final TextEditingController controller;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: height,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
