import 'package:find_my_book/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.height, required this.radius}) : initialText = null;

  const SearchTextField.withInitialText({super.key, required this.height, required this.radius, required this.initialText});

  final String? initialText;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchController>(context, listen: false);
    final txtController = TextEditingController(text: initialText);

    return Expanded(
      child: SizedBox(
        height: height,
        child: TextField(
            onTap: () => txtController.selection = TextSelection(baseOffset: 0, extentOffset: txtController.value.text.length),
            controller: txtController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              hintText: AppLocalizations.of(context)?.search,
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
}
