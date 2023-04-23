import 'package:find_my_book/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.height,
    required this.radius,
  });
  final double height;
  final double radius;
  static const double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchController>(context, listen: false);
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {
          controller.currentPage = 1;
          controller.search();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          )),
        ),
        child: const Icon(
          Icons.search,
          size: iconSize,
        ),
      ),
    );
  }
}
