import 'package:find_my_book/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Direction { previous, next }

class PaginationButton extends StatelessWidget {
  const PaginationButton.previous({super.key}) : direction = Direction.previous;
  const PaginationButton.next({super.key}) : direction = Direction.next;

  final Direction direction;

  final double height = 32;
  final double iconSize = 24;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchController>(context, listen: false);
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {
          direction == Direction.previous ? controller.goToPreviousPage() : controller.goToNextPage();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[850],
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size.fromRadius(height / 2),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        child: Icon(
          direction == Direction.previous ? Icons.navigate_before : Icons.navigate_next,
          size: iconSize,
        ),
      ),
    );
  }
}
