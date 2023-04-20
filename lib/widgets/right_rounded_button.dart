import 'package:flutter/material.dart';

class RightRoundedButton extends StatelessWidget {
  const RightRoundedButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.height,
    required this.radius,
  });

  final VoidCallback onPressed;
  final IconData iconData;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          )),
        ),
        child: Icon(
          iconData,
          size: 32,
        ),
      ),
    );
  }
}
