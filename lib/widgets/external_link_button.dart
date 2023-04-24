import 'package:find_my_book/controllers/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExternalLinkButton extends StatelessWidget {
  const ExternalLinkButton(
    this.link, {
    super.key,
  });

  final String? link;
  static const double height = 50;
  static const double radius = 30;
  static const double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Purchase from Google Books",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(width: 6),
            Icon(
              Icons.arrow_outward,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
