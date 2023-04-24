import 'package:find_my_book/models/response/item_model.dart';
import 'package:find_my_book/widgets/external_link_button.dart';
import 'package:find_my_book/widgets/toggle_favorite_button.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  static const routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(title: Text("${item.volumeInfo.title} ")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 154,
                        height: 221,
                        child: item.volumeInfo.imageLinks?.thumbnail != null
                            ? Image.network(
                                item.volumeInfo.imageLinks!.thumbnail,
                                fit: BoxFit.cover,
                              )
                            : const Placeholder(),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black, fontSize: 22),
                            children: [
                              TextSpan(text: item.volumeInfo.title),
                              TextSpan(text: item.volumeInfo.subtitle != null ? ": ${item.volumeInfo.subtitle}" : null),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                    child: Divider(thickness: 2),
                  ),
                  if (item.volumeInfo.authors != null) ...[
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                      child: RichText(
                        text: TextSpan(style: const TextStyle(color: Colors.black, fontSize: 16), children: [
                          TextSpan(text: "By ${item.volumeInfo.authors!.join(", ")}"),
                          TextSpan(text: item.volumeInfo.publishedDate != null ? " · ${item.volumeInfo.publishedDate!.substring(0, 4)}" : null),
                        ]),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        textAlign: TextAlign.justify,
                        item.volumeInfo.description ?? "",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 30),
                      child: ExternalLinkButton(item.id),
                    )
                  ]
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ToggleFavoriteButton(item),
              ),
            )
          ],
        ),
      ),
    );
  }
}
