import 'package:find_my_book/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.height, required this.radius}) : initialText = null;

  SearchTextField.withInitialText({super.key, required this.height, required this.radius, required this.initialText});

  final String? initialText;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchController>(context, listen: false);

    final TextEditingController? initialTextController;
    if (initialText != null) {
      initialTextController = TextEditingController(text: initialText);
    } else {
      initialTextController = null;
    }
    return Expanded(
      child: SizedBox(
        height: height,
        child: TextField(
            controller: initialTextController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.teal[50],
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
//TODO: Fix visual bug where letters are cut in half when text gets too long
}
