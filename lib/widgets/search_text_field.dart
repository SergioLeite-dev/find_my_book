import 'package:find_my_book/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.height,
    required this.radius,
  });
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchController>(context, listen: false);
    return Expanded(
      child: SizedBox(
        height: height,
        child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                ),
              ),
            ),
            onChanged: (value) {
              controller.searchRequest = controller.searchRequest.copyWith(querry: value);
            }),
      ),
    );
  }
}
