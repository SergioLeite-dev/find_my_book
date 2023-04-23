import 'package:find_my_book/controllers/favorites_controller.dart';
import 'package:find_my_book/models/response/item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleFavoriteButton extends StatelessWidget {
  const ToggleFavoriteButton(
    this.item, {
    super.key,
  });

  final Item item;
  static const double height = 36;
  static const double iconSize = 26;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FavoritesController>(context);
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () => controller.toggleFavorite(item),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.withOpacity(0.6),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const Size.fromRadius(height / 2),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        child: controller.isItemFavorite(item.id)
            ? const Icon(
                Icons.star,
                color: Colors.yellow,
                size: iconSize,
              )
            : const Icon(
                Icons.star_border,
                color: Colors.white,
                size: iconSize,
              ),
      ),
    );
  }
}
