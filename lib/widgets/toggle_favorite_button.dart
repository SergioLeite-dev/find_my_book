import 'package:flutter/material.dart';

class ToggleFavoriteButton extends StatelessWidget {
  const ToggleFavoriteButton({
    super.key,
  });

  static const double height = 36;
  static const double iconSize = 26;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.withOpacity(0.6),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const Size.fromRadius(height / 2),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        child: const Icon(
          Icons.star,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
