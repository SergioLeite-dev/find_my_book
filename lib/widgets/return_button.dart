import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    super.key,
    required this.height,
  });

  final double height;
  final double iconSize = 28;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size.fromRadius(height / 2),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        child: Icon(
          Icons.arrow_back,
          size: iconSize,
        ),
      ),
    );
  }
}
