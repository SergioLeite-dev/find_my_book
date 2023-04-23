import 'package:find_my_book/views/favorites_screen.dart';
import 'package:flutter/material.dart';

class GoToFavoritesButton extends StatelessWidget {
  const GoToFavoritesButton({
    super.key,
  });
  static const double height = 50;
  static const double radius = 30;
  static const double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(FavoritesScreen.routeName);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.star,
              size: iconSize,
            ),
            SizedBox(width: 6),
            Text("Favorites"),
          ],
        ),
      ),
    );
  }
}